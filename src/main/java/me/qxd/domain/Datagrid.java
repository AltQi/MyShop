package me.qxd.domain;

import java.util.ArrayList;
import java.util.List;

public class Datagrid  implements java.io.Serializable{

	private Long total = 0L;
	private List rows = new ArrayList();

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}
