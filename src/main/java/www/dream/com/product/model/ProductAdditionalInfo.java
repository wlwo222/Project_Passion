package www.dream.com.product.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

@Data
@NoArgsConstructor
public class ProductAdditionalInfo extends CommonMngVO{
	private	String productId;
	private String productAddInfoType;
	private String description;
	//0부터 시작! 첫번째는 score, 두번째는 color 세번째는 size 네번째는 quantity, 다섯번째는 reviewcount, 여섯번째는 image
	@Override
	public String toString() {
		return "ProductAddtionalInfo [productId=" + productId + ", productAddInfoType=" + productAddInfoType
				+ ", description=" + description + "]";
	}
	public ProductAdditionalInfo(String productAddInfoType , String description, String productId) {
		this.productAddInfoType = productAddInfoType;
		this.description = description;
		this.productId = productId;
	}
}