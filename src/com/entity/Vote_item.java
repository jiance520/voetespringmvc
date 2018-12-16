package com.entity;

public class Vote_item {
    private Long viId;

    private Long vuUserId;

    private Long vsId;

    private Long voId;

    public Long getViId() {
        return viId;
    }

    public void setViId(Long viId) {
        this.viId = viId;
    }

    public Long getVuUserId() {
        return vuUserId;
    }

    public void setVuUserId(Long vuUserId) {
        this.vuUserId = vuUserId;
    }

    public Long getVsId() {
        return vsId;
    }

    public void setVsId(Long vsId) {
        this.vsId = vsId;
    }

    public Long getVoId() {
        return voId;
    }

    public void setVoId(Long voId) {
        this.voId = voId;
    }
    
	public Vote_item() {
		super();
	}

	@Override
	public String toString() {
		return "Vote_item [viId=" + viId + ", vuUserId=" + vuUserId + ", vsId="
				+ vsId + ", voId=" + voId + "]";
	}
    
}