package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Select;
public interface MusicMapper {
	@Select("SELECT mno,title,singer,poster,album,state,idcrement,key,num "
			+"FROM (SELECT mno,title,singer,poster,album,state,idcrement,key,rownum as num "
			+"FROM (SELECT mno,title,singer,poster,album,state,idcrement,key "
			+"FROM genie_music ORDER BY mno ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<MusicVO> musicListData(Map map);
	
	@Select("SELECT * FROM genie_music "
			+"WHERE mno=#{mno}")
	public MusicVO musicDetailData(int mno);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM genie_music")
	public int musicTotalPage();
}
