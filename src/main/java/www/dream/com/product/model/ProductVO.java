package www.dream.com.product.model;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class ProductVO extends CommonMngVO{
	private	String productId;
	private String categoryId;
	private int	   quantity;
	private String productName;
	private int	   price;
	private String productSize;
	private String sellen; //판매상태. 0은 판매 전, 1은 판매 중, 2는 매진 및 재고소진
	
	//private List<AttchVO> listAttachVo;
	
	private List<ProductAddtionalInfo> pdAddInfo = new ArrayList<>();

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", categoryId=" + categoryId + ", quantity=" + quantity
				+ ", productName=" + productName + ", price=" + price + ", productSize=" + productSize + ", PdAddInfo="
				+ pdAddInfo + ", toString()=" + super.toString() + "]";
	}
	
	
}

