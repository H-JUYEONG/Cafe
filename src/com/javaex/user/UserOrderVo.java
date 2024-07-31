package com.javaex.user;

public class UserOrderVo {

	private int userOrderId;
	private int receiptId;
	private int drinkId;
	private int userId;
	private int drinkCnt;

	public UserOrderVo() {

	}

	public UserOrderVo(int userOrderId, int receiptId, int drinkId, int userId, int drinkCnt) {
		this.userOrderId = userOrderId;
		this.receiptId = receiptId;
		this.drinkId = drinkId;
		this.userId = userId;
		this.drinkCnt = drinkCnt;
	}

	public int getUserOrderId() {
		return userOrderId;
	}

	public void setUserOrderId(int userOrderId) {
		this.userOrderId = userOrderId;
	}

	public int getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(int receiptId) {
		this.receiptId = receiptId;
	}

	public int getDrinkId() {
		return drinkId;
	}

	public void setDrinkId(int drinkId) {
		this.drinkId = drinkId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDrinkCnt() {
		return drinkCnt;
	}

	public void setDrinkCnt(int drinkCnt) {
		this.drinkCnt = drinkCnt;
	}

	@Override
	public String toString() {
		return "UserOrderVo [userOrderId=" + userOrderId + ", receiptId=" + receiptId + ", drinkId=" + drinkId
				+ ", userId=" + userId + ", drinkCnt=" + drinkCnt + "]";
	}

}
