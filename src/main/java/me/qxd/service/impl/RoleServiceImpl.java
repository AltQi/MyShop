package me.qxd.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;











import me.qxd.dao.RoleMapper;
import me.qxd.dao.RoleResourceMapper;
import me.qxd.dao.UserMapper;
import me.qxd.domain.Datagrid;
import me.qxd.domain.Resource;
import me.qxd.domain.Role;
import me.qxd.domain.RoleResource;
import me.qxd.service.RoleServiceI;
@Service("roleService")
public class RoleServiceImpl implements RoleServiceI {
    @Autowired
    private RoleMapper roleMapper;//注入dao
    @Autowired
    private RoleResourceMapper roleResourceMapper;//注入dao

	@Override
	public Datagrid datagrid(Role role) {
		// TODO Auto-generated method stub
		int start = (role.getPage()-1)*role.getRows();
		role.setPage(start);
		Datagrid dg = new Datagrid();
		dg.setTotal(roleMapper.getTotalNumber(role));
		
		dg.setRows(roleMapper.getPageUser(role));
		
		return dg;
	}

	@Override
	public void edit(Role role) {
		// TODO Auto-generated method stub
		roleMapper.updateByPrimaryKey(role);
		RoleResource roleresource = new RoleResource() ;
		/*roleresource.setId(UUID.randomUUID().toString().replace("-",""));*/
		roleresource.setRoleId(role.getId());
		System.out.println(role.getResourceIds());
		for(String id : role.getResourceIds().split(",")){
			roleresource.setResourceId(id);
			RoleResource roleresource1=roleResourceMapper.find(roleresource);
			if(roleresource1==null){
				roleresource.setId(UUID.randomUUID().toString().replace("-",""));
				roleResourceMapper.insert(roleresource);
			}
		}
	
	}

	@Override
	public Role addone(Role role) {
		// TODO Auto-generated method stub
		role.setId(UUID.randomUUID().toString().replace("-",""));
		roleMapper.addone(role);
		RoleResource roleresource = new RoleResource() ;
		for(String id : role.getResourceIds().split(",")){
			roleresource.setResourceId(id);
			roleresource.setRoleId(role.getId());
				roleresource.setId(UUID.randomUUID().toString().replace("-",""));
				roleResourceMapper.insert(roleresource);
			
		}
		return role;
	}

	@Override
	public Role add(Role role) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void remove(Role role) {
		// TODO Auto-generated method stub
		for (String id : role.getIds().split(",")) {
			Role role1=new Role();
			role1.setId(id);
			RoleResource roleresource = new RoleResource() ;
			roleresource.setRoleId(role1.getId());
			roleResourceMapper.deleteByrole(roleresource);
			roleMapper.deleteByPrimaryKey(role1);

	}
	}

}
