package com.idea.nursing.stock.web.dao;

import com.idea.nursing.core.generic.GenericDao;
import com.idea.nursing.stock.web.domain.pojo.Stock;
import com.idea.nursing.stock.web.domain.pojo.StockExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StockMapper extends GenericDao {
    int countByExample(StockExample example);

    int deleteByExample(StockExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Stock record);

    int insertSelective(Stock record);

    List<Stock> selectByExample(StockExample example);

    Stock selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Stock record, @Param("example") StockExample example);

    int updateByExample(@Param("record") Stock record, @Param("example") StockExample example);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);
}