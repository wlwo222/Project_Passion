package www.dream.com.product.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class ProductAddtionalInfo extends CommonMngVO{
	private	String productId;
	private String productAddInfoType;
	private String description;
	//0부터 시작! 첫번째는 color, 두번째는 image 세번째는 quantity 네번째는 reviewcount, 다섯번째는 score, 여섯번째는 사이즈
	@Override
	public String toString() {
		return "ProductAddtionalInfo [productId=" + productId + ", productAddInfoType=" + productAddInfoType
				+ ", description=" + description + "]";
	}
}