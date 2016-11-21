package com.niit.onlineshopping.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Customer 
{
	@Id
	private int cid;
	private String cname;
	private String caddress;
	private int cphone;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public int getCphone() {
		return cphone;
	}
	public void setCphone(int cphone) {
		this.cphone = cphone;
	}
}
