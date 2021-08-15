package www.dream.com.hashTag.persistence;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import www.dream.com.hashTag.model.HashtagVO;
import www.dream.com.hashTag.model.IHashTagOpponent;

public interface HashTagMapper {
	/**
	 * setHashTag로 받은 단어 중에 기존에 관리하고 있는 단어 집합 찾기
	 * @param setHashTag isEmpty() false일때만 불러주세요
	 * @return
	 */
	public Set<HashtagVO> findExisting(@Param("setHashTag") Set<String> setHashTag);
	public Set<HashtagVO> findPrevUsedHashTag(@Param("opponent") IHashTagOpponent hashTagOpponent, @Param("curSearch") Set<String> curSearch);
	
	/**
	 * HashtagVOdml id를 지정한 개수만큼 Sequence를 통하여 한번에 왕창 만들기. 성능
	 * @param cnt
	 * @return
	 */
	public String getIds(int cnt);
	public int createHashTag(@Param("setNewHashTag") Set<HashtagVO> newHashtag);
	
	/**
	 * Hashtag와 Post 사이의 관계 정보 다중 입력(고성능)하기
	 * @param setExisting Table에 존재하는 단어의 ID
	 * @param opponent 상대방 
	 * @return
	 */
	public int insertMapBetweenStringId(@Param("setExisting") Set<HashtagVO> setExisting,
			@Param("opponent") IHashTagOpponent opponent);
	//Mybatis는 Operator overloading 지원안됨
	public void deleteMapBetweenStringId(@Param("opponent") IHashTagOpponent hashTagOpponent);
	public void deleteMapBetweenOpponentStringId(@Param("setExisting") Set<HashtagVO> setExisting, @Param("opponent") IHashTagOpponent hashTagOpponent);

	
}
