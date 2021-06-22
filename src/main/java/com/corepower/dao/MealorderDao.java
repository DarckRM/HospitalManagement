package com.corepower.dao;

import com.corepower.domain.Customer;
import com.corepower.domain.Mealorder;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MealorderDao {
    public List<Customer> getAll();
    //找到所有所有数据
    //获取总条数
    public Integer totalCount(@Param("nickname") String username, @Param("relname") String relname, @Param("id") Integer id);
    //获取订餐列表
    public List<Mealorder> getMealorderList(@Param("nickname") String username, @Param("relname") String relname, @Param("id") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
    //更新订餐信息
    @Select("update t_customer set openid = #{openid}, nickname = #{nickname}, sex = #{sex}, avatar = #{avatar}, mobilephone = #{mobilephone}, relname = #{relname} , no = #{no}," +
            " height = #{height}, weight = #{weight}, chest = #{chest},waist = #{waist}, buttock = #{buttock}, head = #{head}, shoesize = #{shoesize}, email = #{email}  where id = #{id}")
    public Mealorder updateMealorder(Mealorder mealorder);
    //插入订餐信息
    @Select("INSERT INTO t_mealorder (cid,breakfast,lunch,dinner,memo) VALUES (#{customerid},#{breakfast},#{lunch},#{dinner},#{memo})")
    public Mealorder insertMealorder(Mealorder mealorder);
    //删除订餐信息
    @Select("delete from t_customer where id = #{id}")
    public Mealorder deleteMealorder(Integer id);
}
