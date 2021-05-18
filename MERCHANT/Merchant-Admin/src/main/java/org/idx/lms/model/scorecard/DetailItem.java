package org.idx.lms.model.scorecard;

public class DetailItem {
	String limit;

	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double d) {
		this.score = d;
	}
	public int getBaseline() {
		return baseline;
	}
	public void setBaseline(int baseline) {
		this.baseline = baseline;
	}
	double score;
	int baseline;
}
