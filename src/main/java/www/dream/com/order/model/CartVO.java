package www.dream.com.order.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.product.model.ProductAdditionalInfo;
import www.dream.com.product.model.ProductVO;

@Data
@NoArgsConstructor
public class CartVO extends OrderVO {
	
	public static final String DESCRIM4CART = "cart";
	private String customerId;
	private List<ProductVO> products;
	private int	 productCount;
	
	//private List<ProductAdditionalInfo> pdAddInfo;
	
	//productId와 Quantity를 Map으로 묶어주고 List를 만들어서 Cart 데이터를 관리합니다. 
	//private List<Map<ProductVO, String>> pdtQuantityMapList = new ArrayList<>();
	
	public CartVO(String customerId) {
		this.customerId = customerId;
	}
	

	public String getProductList() {
		StringBuilder sb = new StringBuilder("<div class='body'>");
		//CartVO 안에 products가 없을 경우엔 장바구니가 비었습니다. 로 출력하고 아닐경우엔, 그 상품의 정보를 출력해준다.
		if(this.products == null) {
			sb.append("장바구니가 비었습니다.");
		} else {		//장바구니안에 상품이 있는 경우
			for(ProductVO product : products) {
				sb.append("<ul class='cartbox'>");
				//해당 사진의 이미지경로에서 사이즈가 m인 파일을 가져옵니다.
				sb.append("<li><img src=" + product.getPdAddInfo().get(5).getDescription().substring( 0,
						product.getPdAddInfo().get(5).getDescription().length() - 4) +"_m.jpg"+ "></li>");
				sb.append("<li>productName : " + product.getName() + "</li>");
				sb.append("<li>size :" + product.getPdAddInfo().get(2).getDescription() + "</li>");
				sb.append("<li>quantity :" + product.getPdAddInfo().get(3).getDescription() + "</li>");
				sb.append("<li>price : " + product.getPrice() + "</li>");
				sb.append("</ul>");	
			}
		}
		sb.append("</div>");
		
		return sb.toString();
	}
}
