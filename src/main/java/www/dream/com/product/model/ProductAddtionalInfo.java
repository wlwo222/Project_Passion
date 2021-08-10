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
	//0은 score, 1은 image, 2는 quantity, 3은 reviewcount ,4는 size, 5는 color
	@Override
	public String toString() {
		return "ProductAddtionalInfo [productId=" + productId + ", productAddInfoType=" + productAddInfoType
				+ ", description=" + description + "]";
	}
}