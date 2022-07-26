package pkg.$;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pkg.movie.MovieDAO;

@Controller
public class AdminController {

	@Autowired
	MovieDAO movieDAO;

	@GetMapping(value={"admin.{menu}"}) 
	public String landing (@PathVariable("menu") String menu, Model model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("content", menu);
		return "admin."+menu;
	}
	
	@ResponseBody
	@PostMapping("admin.movie.select")
	public String selectMovie (@RequestBody Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {

		return new Gson().toJson("");
	}
	@ResponseBody
	@PostMapping("admin.movie.reflect2")
	public String reflectKMDb (@RequestBody Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(params);
		ArrayList<Map<String,Object>> movies = (ArrayList<Map<String, Object>>)params.get("Result");
		ArrayList<Map<String,Object>> actor = null;
		ArrayList<Map<String,Object>> director = null;
		
		for(Map<String, Object> movie : movies) {
			String docid = (String)movie.get("DOCID");
			
			Map<String, Object> actors = (Map<String, Object>) movie.get("actors"); // actors{ actor : [ {}, {}, {} ] }
			actor = (ArrayList<Map<String, Object>>) actors.get("actor"); // [ {}, {}, {} ]
			
			for(Map<String, Object> obj : actor) {
				obj.put("role", "a");
				obj.put("docid", docid);	//obj{ actorId, actorNm, actorEnNm, docid }
			}
			
			// actorService.insertActors(actor); how to return?
			
			Map<String, Object> directors = (Map<String, Object>) movie.get("directors"); // directors{ director : [ {}, {}, {} ] }
			director = (ArrayList<Map<String, Object>>) directors.get("director"); // [ {}, {}, {} ]
			
			for(Map<String, Object> obj : director) { 
				obj.put("role", "d");
				obj.put("docid", docid);	//obj{ directorId, directorNm, directorEnNm, docid }
			}
			
			// directorService.insertDirectors(director); how to return?
			
		}
		
		// Map<String, Object> oracleReturns = movieService.insertMovie(movies);\
		// Map< ... ? > = movieCastService.insertCast();
		// Map< ... ? > = staffService.inertStaff();
		// return new Gson().toJson(oracleReturns); oracleReturns{ docid1 : {errMsg, sqlMsg, sqlErr}, docid2 : {}, ... };	
		// return new Gson().toJson(oracleReturns); oracleReturns[ {docid, errMsg, sqlMsg, sqlErr}, {}, ...  ];
			
		return new Gson().toJson("");
	}
	@ResponseBody
	@PostMapping("admin.movie.update")
	public String updateMovieDatabase (@RequestBody Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {
		
		// Map<String, Object> oracleResult = movieService.update(params);
		// actorService.update(actors);
		// directorService.update(directors);
		ArrayList<Map<String,Object>> result = (ArrayList<Map<String, Object>>)params.get("Result");
		Map<String, Object> movie = result.get(0);
		Map<String, Object> actors = (Map<String, Object>)movie.get("actors");
		List<Object> actor = (List<Object>)actors.get("actor");
		System.out.println(">> admin.movie.update");
		System.out.println(actors);
		System.out.println(actor);
			

		return new Gson().toJson("");
	}
	@PostMapping("admin.movie.delete")
	public String deleteMovie (@RequestBody Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {

		return new Gson().toJson("");
	}

	@PostMapping("admin.member.select")
	public String selectMember () {
		
		return new Gson().toJson("");
	}
	@PostMapping("admin.member.update")
	public String updateMember () {
		
		return new Gson().toJson("");
	}
	@PostMapping("admin.member.delete")
	public String deleteMember () {
		
		return new Gson().toJson("");
	}

	@ResponseBody
	@PostMapping("admin.movie.reflect")
	public String testMember (@RequestBody Map<String, Object> params) {

		System.out.println("----------------");
		List<Map<String, Object>> movieArray = (List<Map<String, Object>>) params.get("Result");
		System.out.println(movieArray);
		List<Map<String, Object>> staffArray = new ArrayList<Map<String, Object>>();

		for (Map<String, Object> movie : movieArray) {

			String docId = (String)movie.get("DOCID");
			
			// staff array to map
			Map<String, String> convertedStaffMap = new HashMap<String, String>();

			Map<String, Object> sMap = (Map<String, Object>) movie.get("staffs");
			List<Map<String, Object>> staff = (ArrayList<Map<String, Object>>) sMap.get("staff");

			for(Map<String, Object> s : staff) {
				convertedStaffMap.put((String)s.get("staffNm"), (String)s.get("staffRoleDetail"));
			}

			// make actor Array
			Map<String, Object> aMap = (Map<String, Object>) movie.get("actors");
			List<Map<String, Object>> actor = (ArrayList<Map<String, Object>>) aMap.get("actor"); // actor[{}, {}]

			for(Map<String, Object> a : actor) {
				a.put("DOCID", docId);
				a.put("role", "actor");		
				a.put("roleDetail", convertedStaffMap.get(a.get("actorNm")));
			}
			

			// make director Array
			Map<String, Object> dMap = (Map<String, Object>) movie.get("directors");
			List<Map<String, Object>> director = (List<Map<String, Object>>) dMap.get("director"); // director[]
			for(Map<String, Object> d : director) {
				d.put("DOCID", docId);
				d.put("role", "director");		
				d.put("roleDetail", convertedStaffMap.get(d.get("directorNm")));
			}

			// merge actor, director Array
			staffArray.addAll(actor);
			staffArray.addAll(director);
		}
 
		Map<String, Object> movies = new HashMap<String, Object>();
		movies.put("movies", movieArray);
		
		Map<String, Object> staffs = new HashMap<String, Object>();
		staffs.put("staffs", staffArray);

		System.out.println(movies); 
		System.out.println(staffs);
		
		//Map<String, Object> oracleReturn = movieService.reflect(movies);
		//staffService.update(staffs);
		//castService.update(staffs);
		
		return new Gson().toJson("");
	}
	////
}
