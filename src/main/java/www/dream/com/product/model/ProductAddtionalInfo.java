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
	
	@Override
	public String toString() {
		return "ProductAddtionalInfo [productId=" + productId + ", productAddInfoType=" + productAddInfoType
				+ ", description=" + description + ", toString()=" + super.toString() + "]";
	}
	
}
