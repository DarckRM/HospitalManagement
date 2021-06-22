package com.corepower.dao;

import com.corepower.domain.Parameter;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import com.corepower.domain.Siteinfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface ParameterDao {
    //查询系统参数
    @Select("select * from t_parameter")
    public Parameter findParameter();
    //修改系统参数
    @Select("update t_parameter set carnumber = #{carnumber}, premoney = #{premoney}, access_token = #{access_token}, access_youxrq = #{access_youxrq}, shortmsgcount = #{shortmsgcount}, shortmsgtemplate = #{shortmsgtemplate}, submitendhour = #{submitendhour}, shortmsgvalidsecond = #{shortmsgvalidsecond}")
    //@Select("select * from t_parameter")
    public Parameter updateParameter(Parameter parameter);
}
