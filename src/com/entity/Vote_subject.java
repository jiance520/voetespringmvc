package com.entity;

public class Vote_subject {
    private Long vsId;

    private String vsTitle;

    private Long vsType;

    public Long getVsId() {
        return vsId;
    }

    public void setVsId(Long vsId) {
        this.vsId = vsId;
    }

    public String getVsTitle() {
        return vsTitle;
    }

    public void setVsTitle(String vsTitle) {
        this.vsTitle = vsTitle == null ? null : vsTitle.trim();
    }

    public Long getVsType() {
        return vsType;
    }

    public void setVsType(Long vsType) {
        this.vsType = vsType;
    }

	public Vote_subject() {
		super();
	}

	@Override
	public String toString() {
		return "Vote_subject [vsId=" + vsId + ", vsTitle=" + vsTitle
				+ ", vsType=" + vsType + "]";
	}
    
}