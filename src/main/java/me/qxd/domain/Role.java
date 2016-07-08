package me.qxd.domain;

import java.util.List;
public class Role {
	
    private String id;
    private String ids;

    private String text;
    private String resourceIds;

    private String resourceNames;
    private List<RoleResource> roleresources;


	public String getResourceIds() {
		return resourceIds;
	}

	public void setResourceIds(String resourceIds) {
		this.resourceIds = resourceIds;
	}

	public String getResourceNames() {
		return resourceNames;
	}

	public void setResourceNames(String resourceNames) {
		this.resourceNames = resourceNames;
	}

	public List<RoleResource> getRoleresources() {
		return roleresources;
	}

	public void setRoleresources(List<RoleResource> roleresources) {
		this.roleresources = roleresources;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<RoleResource> getRoleresource() {
		return roleresources;
	}

	public void setRoleresource(List<RoleResource> roleresource) {
		this.roleresources = roleresource;
	}

	public String getId() {
        return id;
    }
	private int page;
	private int rows;
	private String sort;
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	private String order;

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }
}