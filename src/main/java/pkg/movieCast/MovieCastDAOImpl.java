package pkg.movieCast;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MovieCastDAOImpl implements MovieCastDAO{
    
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Map<String, List<String>> getDirectorAPI(Map<String, Object> params){
		
		
		
		List<Object> API = (List<Object>)params.get("Data");        //������ API  ��ü ������ {Data = [{}]} 
        Map<String, Object> API2 = (Map<String,Object>)API.get(0);		  
		List<Object> API3 = (List<Object>)API2.get("Result");	    // API��  Result��ü �ȿ� �ִ� ������ ��������.(��ü ������)
        Map<String, Object> map = new HashMap<String, Object>();
		
		params.get("");
		
		//Map<String, Object> map = new HashMap<String, Object>();		
		sqlSession.selectList("", map);
		
		
		return null;
	}
	
	
}
