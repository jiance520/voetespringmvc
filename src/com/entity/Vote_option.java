package com.entity;

public class Vote_option {
    private Long voId;

    private Long vsId;

    private String voOption;

    private Long voOrder;

    public Long getVoId() {
        return voId;
    }

    public void setVoId(Long voId) {
        this.voId = voId;
    }

    public Long getVsId() {
        return vsId;
    }

    public void setVsId(Long vsId) {
        this.vsId = vsId;
    }

    public String getVoOption() {
        return voOption;
    }

    public void setVoOption(String voOption) {
        this.voOption = voOption == null ? null : voOption.trim();
    }

    public Long getVoOrder() {
        return voOrder;
    }

    public void setVoOrder(Long voOrder) {
        this.voOrder = voOrder;
    }

	public Vote_option() {
		super();
	}

	@Override
	public String toString() {
		return "Vote_option [voId=" + voId + ", vsId=" + vsId + ", voOption="
				+ voOption + ", voOrder=" + voOrder + "]";
	}
    
}