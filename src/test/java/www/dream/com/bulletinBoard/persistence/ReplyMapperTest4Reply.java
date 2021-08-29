package www.dream.com.bulletinBoard.persistence;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.bulletinBoard.model.ReplyVO;
import www.dream.com.party.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ReplyMapperTest4Reply {
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private ReplyMapper postMapper;

	//@Test
	public void test040GetReviewList() {
		try {
			List<ReplyVO> reviews =	(replyMapper.getReviewList());
			System.out.println(reviews);
			reviews.forEach(re -> {
				System.out.println(re);
			});
			assertNotNull(reviews);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void test041findReviewByproductId() {
		try {
			List<ReplyVO> replys = replyMapper.findReviewListById("1");
			System.out.println(replys);
			replys.forEach(re -> {
				System.out.println(re);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	//@Test
	public void test000InsertReview() {
		try {
			ReplyVO reply = new ReplyVO();
			reply.setContent("하하");
			reply.setOwnerId("1");
			reply.setWriter(new Member("mana1"));
			System.out.println(reply);
			replyMapper.insertReview(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void test002InsertReplyOfReply() {
		try {
			//자게 최신글 찾아서 original(원글)로 삼자
			//댓글 아무렇게 만들어서 insert
			Member lee = new Member("lee");
			IntStream.rangeClosed(0, 1).forEach(i->{
				//ReplyVO reply = new ReplyVO("content" + i, lee);
				//replyMapper.insertReply("0000200006", reply);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void test030UpdateReview() {
		try {
			ReplyVO reply = replyMapper.findReviewByReplyId("2");
			reply.setContent("수정된 내용");
			replyMapper.updateReview(reply);
			System.out.println(replyMapper.findReviewByReplyId("2"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test040DeleteReview() {
		try {
			replyMapper.deleteReviewByReplyId("2");
			System.out.println("성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}







