package www.dream.com.bulletinBoard.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.dream.com.bulletinBoard.model.BoardVO;
import www.dream.com.bulletinBoard.model.PostVO;
import www.dream.com.bulletinBoard.model.ReplyVO;
import www.dream.com.bulletinBoard.persistence.ReplyMapper;
import www.dream.com.common.attachFile.model.AttachFileVO;
import www.dream.com.common.attachFile.persistence.AttachFileVOMapper;
import www.dream.com.common.dto.Criteria;
import www.dream.com.framework.langPosAnalyzer.PosAnalyzer;
import www.dream.com.hashTag.service.HashTagService;
import www.dream.com.party.model.Party;

/**
 * ReplyVO와 PostVO의 클래스 설계도를 기반으로
 * 해당 Table을 Top-전략으로 통합하여 만들었기에
 * ReplyMapper는 통합해 놓았다.
 * PostService와 ReplyService와 분리하였다.
 * @author ivarBae
 */
@Service
public class PostService {
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private HashTagService hashTagService;
	
	@Autowired
	private AttachFileVOMapper attachFileVOMapper;

	//LRCUD
	public long getSearchTotalCount(int boardId, Criteria cri) {
		if (cri.hasSearching()) {
			return replyMapper.getSearchTotalCount(boardId, cri);
		} else {
			return replyMapper.getTotalCount(boardId, PostVO.DESCRIM4POST);
		}
	}
	
	//BoardId만으로 Index.jsp 조회 ㄱㄱ
	public List<ReplyVO> getReviewList(){
		return replyMapper.getReviewList();
	}
	
	/* mapper 함수의 인자 개수가 여러개 일 때는 필수적으로 @Param을 넣어야 합니다
	 * 이를 실수하지 않기 위하여 한개여도 그냥 명시적으로 넣어 주세요 */
	public List<PostVO> getListByHashTag(Party curUser, int boardId, Criteria cri) {
		
		if (cri.hasSearching()) {
			String[] searchingHashtags = cri.getSearchingHashtags();
			if (curUser != null) {
				mngPersonalFavorite(curUser, searchingHashtags);
			}
			return replyMapper.getListByHashTag(boardId, cri);
		} else {
			if (curUser == null) {
				return null;
				/* 임시적으로 페이징처리 개발하기 전에 함수를 주석처리하였습니다.
				 * return replyMapper.getList(boardId, cri); */
			} else {
				//개인화 서비스 
				return replyMapper.getFavorite(boardId, curUser);
			}
		}
	}

	/** id 값으로 Post 객체 조회 */
	public PostVO findPostById(String id) {
		return (PostVO) replyMapper.findReplyById(id);
	}
	
	@Transactional
	public int insert(BoardVO board, PostVO post) {
		int affectedRows = replyMapper.insert(board, post);
		Map<String, Integer> mapOccur = PosAnalyzer.getHashTags(post);
		hashTagService.createHashTagAndMapping(post, mapOccur);
		
		//첨부 파일 정보도 관리합니다. 고성능
		List<AttachFileVO> listAttach = post.getListAttach();
		if (listAttach != null && ! listAttach.isEmpty()) {
			attachFileVOMapper.insert(post.getId(), listAttach);
		}
		return affectedRows;
	}

	/** 게시글 수정 처리 
	 * 첨부 파일 정보 기존 것 다 없애고 다시 등록
	 * 연관 단어도 기존 것 다 없애고 다시 등록
	 */
	@Transactional
	public boolean updatePost(PostVO post) {
		attachFileVOMapper.delete(post.getId());
		//첨부 파일 정보도 관리합니다. 고성능
		List<AttachFileVO> listAttach = post.getListAttach();
		if (listAttach != null && ! listAttach.isEmpty()) {
			attachFileVOMapper.insert(post.getId(), listAttach);
		}
		hashTagService.deleteMap(post);
		Map<String, Integer> mapOccur = PosAnalyzer.getHashTags(post);
		hashTagService.createHashTagAndMapping(post, mapOccur);
		
		return replyMapper.updatePost(post) == 1;
	}
	
	/** id 값으로 Post 객체 삭제 */
	@Transactional
	public boolean deletePostById(String id) {
		PostVO post = new PostVO();
		post.setId(id);
		hashTagService.deleteMap(post);
		attachFileVOMapper.delete(id);
		return replyMapper.deleteReplyById(id) == 1;
	}
	
	private void mngPersonalFavorite(Party curUser, String[] searchingHashtags) {
		Map<String, Integer> mapOccur = new HashMap<>();
		Arrays.stream(searchingHashtags).forEach(word->{
			mapOccur.put(word, 1);
		});
		
		hashTagService.mngHashTagAndMapping(curUser,mapOccur);
		
	}
}
