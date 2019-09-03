package com.wad.udo.restaurant.dao;

import java.util.List;
import java.util.Map;

import com.wad.udo.restaurant.domain.RestCmtInfo;
import com.wad.udo.restaurant.domain.RestInfo;
import com.wad.udo.restaurant.domain.SearchParam;

public interface RestDao {
	public int insertRest(RestInfo restInfo);
	public RestInfo selectRestInfoByIdx(int r_idx);
	public List<RestInfo> selectListAll(Map<String, Object> param);
	public int selectTotalCount(SearchParam searchParam);
	public int insertComment(RestCmtInfo cmtInfo);
	public List<RestCmtInfo> selectCommentListAll(int r_idx);
	public int deleteCmt(int r_c_idx);
	public int updateCmt(Map<String, Object> map);
}