package com.demo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.demo.dao.UserMapper;
import com.demo.pojo.Address;
import com.demo.pojo.User;
import com.demo.util.AbstractServlet;
import com.demo.util.MyBatisUtil;
import com.demo.util.ReturnResult;


/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}
	//加载列表信息
	public String getUser(HttpServletRequest request, HttpServletResponse response) {
		SqlSession session=null;
		try {
			List<User> list=new ArrayList<User>();
			session=MyBatisUtil.createSqlSession();
			list=session.getMapper(UserMapper.class).getUser();
			request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
		return "/index";
	}
	//根据id查询用户数据
	public String getUserById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession session=null;
		try {
			session=MyBatisUtil.createSqlSession();
			int id=Integer.parseInt(request.getParameter("id"));
			
			User user=session.getMapper(UserMapper.class).getUserById(id);
			request.setAttribute("users", user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
		return "/updateUser";
	}
	//修改用户信息
	public void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession session=null;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			session=MyBatisUtil.createSqlSession();
			User user=new User();
			user.setUserCode(request.getParameter("userCode"));
			user.setUserName(request.getParameter("userName"));
			user.setUserPassword(request.getParameter("userPassword"));
			user.setGender(Integer.parseInt(request.getParameter("gender")));
			user.setBirthday(request.getParameter("birthday"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setUserType(Integer.parseInt(request.getParameter("userType")));
			user.setCreatedBy(Integer.parseInt(request.getParameter("createdBy")));
			user.setCreationDate(request.getParameter("creationDate"));
			user.setModifyBy(Integer.parseInt(request.getParameter("modifyBy")));
			user.setModifyDate(request.getParameter("modifyDate"));
			user.setUserRole(Integer.parseInt(request.getParameter("userRole")));
			user.setId(Integer.parseInt(request.getParameter("id")));
			int result=session.getMapper(UserMapper.class).updateUser(user);
			session.commit();
			if (result==1) {
				out.print("<script>alert('信息修改成功');location.href='UserServlet?action=getUser'</script>");
			}else {
				out.print("<script>alert('信息修改失败');location.href='updateUser.jsp'</script>");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
	}
	//删除信息
	public ReturnResult  delUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReturnResult rr=new ReturnResult();
		SqlSession session=null;
		try {
			session=MyBatisUtil.createSqlSession();
			int id=Integer.parseInt(request.getParameter("id"));
			int res=session.getMapper(UserMapper.class).delUser(id);
			if (res==1) {
				rr.returnSuccess("删除成功");
			}else {
				rr.returnFail("删除失败");
			}
			session.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
		return rr;
	}
	//添加用户信息
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		SqlSession session=null;
		try {
			session=MyBatisUtil.createSqlSession();
			User user=new User();
			user.setUserCode(request.getParameter("userCode"));
			user.setUserName(request.getParameter("userName"));
			user.setUserPassword(request.getParameter("userPassword"));
			user.setGender(Integer.parseInt(request.getParameter("gender")));
			user.setBirthday(request.getParameter("birthday"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setUserType(Integer.parseInt(request.getParameter("userType")));
			user.setCreatedBy(Integer.parseInt(request.getParameter("createdBy")));
			user.setCreationDate(request.getParameter("creationDate"));
			user.setModifyBy(Integer.parseInt(request.getParameter("modifyBy")));
			user.setModifyDate(request.getParameter("modifyDate"));
			user.setUserRole(Integer.parseInt(request.getParameter("userRole")));
			int result=session.getMapper(UserMapper.class).addUser(user);
			session.commit();
			if (result==1) {
				out.print("<script>alert('信息添加成功');location.href='UserServlet?action=getUser'</script>");
			}else {
				out.print("<script>alert('信息添加失败');location.href='addUser.jsp'</script>");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
	}
	/*
	 * 查询Role和User两表的数据 id不展示
	 */
	public String getUserByRole(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession session=null;
		try {
			session=MyBatisUtil.createSqlSession();
			List<User> list=new ArrayList<User>(); 
			list=session.getMapper(UserMapper.class).getUserByRole();
			request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
		return "/addUserByRole";
	}
	/*
	 * 一对多
	 */
	public String getAddressListById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession session=null;
		User user=null;
		try {
			session=MyBatisUtil.createSqlSession();
			//List<User> list=new ArrayList<User>();
			user=session.getMapper(UserMapper.class).getAddressListById(1);
			if(user!=null) {
				request.setAttribute("user", user);
				if(user.getAddressList().size()>0) {
					List<Address> address=user.getAddressList();
					request.setAttribute("address", address);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
		return "/userByAddress";
	}
	/*
	 * 用户名修改
	 */
	public void updateUserByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession session=null;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			session=MyBatisUtil.createSqlSession();
			String name=request.getParameter("userName");
			int id=Integer.parseInt(request.getParameter("id"));
			int result=session.getMapper(UserMapper.class).updateUserByName(name,id);
			session.commit();
			if (result==1) {
				out.print("<script>alert('用户名修改成功');location.href='UserServlet?action=getUser'</script>");
			}else {
				out.print("<script>alert('用户名修改失败');location.href='updateUserByName.jsp'</script>");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisUtil.closeSqlSession(session);
		}
	}
	//根据id查询用户数据
		public String getUserByIds(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			SqlSession session=null;
			try {
				session=MyBatisUtil.createSqlSession();
				int id=Integer.parseInt(request.getParameter("id"));
				
				User user=session.getMapper(UserMapper.class).getUserById(id);
				request.setAttribute("users", user);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				MyBatisUtil.closeSqlSession(session);
			}
			return "/updateUserByName";
		}
	
	public Class getServletClass() {
		// TODO Auto-generated method stub
		return UserServlet.class;
	}
}
