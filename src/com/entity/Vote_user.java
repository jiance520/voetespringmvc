package com.entity;

import javax.validation.constraints.Pattern;

public class Vote_user {
    private Long vuUserId;

    private String vuUserName;
    @Pattern(regexp="[0-9a-z]{1,10}",message="密码格式错误")
    private String vuPassword;

    private Long vuStatus;

    public Long getVuUserId() {
        return vuUserId;
    }

    public void setVuUserId(Long vuUserId) {
        this.vuUserId = vuUserId;
    }

    public String getVuUserName() {
        return vuUserName;
    }

    public void setVuUserName(String vuUserName) {
        this.vuUserName = vuUserName == null ? null : vuUserName.trim();
    }

    public String getVuPassword() {
        return vuPassword;
    }

    public void setVuPassword(String vuPassword) {
        this.vuPassword = vuPassword == null ? null : vuPassword.trim();
    }

    public Long getVuStatus() {
        return vuStatus;
    }

    public void setVuStatus(Long vuStatus) {
        this.vuStatus = vuStatus;
    }

	public Vote_user() {
		super();
	}

	@Override
	public String toString() {
		return "Vote_user [vuUserId=" + vuUserId + ", vuUserName=" + vuUserName
				+ ", vuPassword=" + vuPassword + ", vuStatus=" + vuStatus + "]";
	}
    
}