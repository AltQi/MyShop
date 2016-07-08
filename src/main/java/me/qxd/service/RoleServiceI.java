package me.qxd.service;

import me.qxd.domain.Datagrid;
import me.qxd.domain.Role;

public  interface RoleServiceI {

	public Datagrid datagrid(Role role) ;
		// TODO Auto-generated method stub
	
	

	public void edit(Role role) ;
	public Role add(Role role) ;
	public Role addone(Role role) ;



	public void remove(Role role);

}
