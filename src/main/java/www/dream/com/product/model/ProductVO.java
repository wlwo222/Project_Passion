package www.dream.com.product.model;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.bulletinBoard.model.BoardVO;
import www.dream.com.bulletinBoard.model.PostVO;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class ProductVO extends BoardVO{
	private	String productId;
	private String categoryId;
	private String productName;
	private String sellen; //판매상태. 0은 판매 전, 1은 한번이라도 판매 된 상태.
	private int price;
	//private List<AttchVO> listAttachVo;
	
	
	private List<ProductAdditionalInfo> pdAddInfo = new ArrayList<>();

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", categoryId=" + categoryId + ", productName=" + productName
				+ ", sellen=" + sellen + ", price=" + price + ", pdAddInfo=" + pdAddInfo + ", toString()="
				+ super.toString() + "]";
	}
	
	public ProductVO(String id) {
		this.productId = id;
	}
}

