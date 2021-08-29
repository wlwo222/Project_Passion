--cart에 담긴 Product 조회와 세부정보 조회
select c.*, p.p_id p_p_id, p.category_id p_category_id, p.p_name p_p_name,
        p.price p_price, pai.PRODUCT_ADD_INFO_TYPE , pai.description
  from cart c left outer join s_products p on c.p_id = p.p_id,
  	s_products s left outer join s_product_add_info pai on s.p_id = pai.p_id
 where c.p_id = '52'
   and s.p_id = c.p_id
   
   
--위의 정보에서 세부정보 중 image, size, color만 가져온다.
select c.*, p.p_id p_p_id, p.category_id p_category_id, p.p_name p_p_name,
        p.price p_price, pai.PRODUCT_ADD_INFO_TYPE , pai.description
  from cart c left outer join s_products p on c.p_id = p.p_id,
  	s_products s left outer join s_product_add_info pai on s.p_id = pai.p_id
 where c.p_id = '52'
   and s.p_id = c.p_id
   and pai.PRODUCT_ADD_INFO_TYPE in ('color','size','image')