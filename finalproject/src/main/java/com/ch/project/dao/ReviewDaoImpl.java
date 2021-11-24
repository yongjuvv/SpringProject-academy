package com.ch.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Review selectMovReview(String email, int movNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("movNum", movNum);
		return sst.selectOne("reviewns.selectMovReview", hm);
	}

	@Override
	public Review selectTvReview(String email, int tvNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("tvNum", tvNum);
		return sst.selectOne("reviewns.selectTvReview", hm);
	}

	@Override
	public int tvReviewRateInsert(String email, int reviewRate, int tvNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("reviewRate", reviewRate);
		hm.put("tvNum", tvNum);
		return sst.insert("reviewns.tvReviewRateInsert", hm);
	}

	@Override
	public int reviewRateUpdate(int reviewRate, int reviewNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewRate", reviewRate);
		hm.put("reviewNum", reviewNum);
		return sst.insert("reviewns.reviewRateUpdate", hm);
	}

	@Override
	public int movReviewRateInsert(String email, int reviewRate, int movNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("reviewRate", reviewRate);
		hm.put("movNum", movNum);
		return sst.insert("reviewns.movReviewRateInsert", hm);
	}

	// 리뷰 코멘트 등록, 수정 (스포 X)
	@Override
	public int writeCommentFirst(Review review) {
		return sst.update("reviewns.writeCommentFirst", review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 O)
	@Override
	public int writeCommentSpoilerFirst(Review review) {
		return sst.update("reviewns.writeCommentSpoilerFirst", review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 X)
	@Override
	public int writeComment(Review review) {
		return sst.update("reviewns.writeComment", review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 O)
	@Override
	public int writeCommentSpoiler(Review review) {
		return sst.update("reviewns.writeCommentSpoiler", review);
	}

	// 리뷰 코멘트 삭제
	@Override
	public int deleteComment(int reviewNum) {
		return sst.update("reviewns.deleteComment", reviewNum);
	}

	// 페이징 작업
	@Override
	public List<Review> list(String email, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("reviewns.list", hm);
	}

	@Override
	public int total(String email) {
		return sst.selectOne("reviewns.total", email);
	}

	@Override
	public List<Review> list2(String email, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("reviewns.list2", hm);
	}

	@Override
	public List<Review> hashMoList(int hashNum) {
		return sst.selectList("reviewns.hashMoList", hashNum);
	}

	@Override
	public List<Review> hashTvList(int hashNum) {
		return sst.selectList("reviewns.hashTvList", hashNum);
	}

	@Override
	public List<Review> movieReviewList(int movNum) {
		return sst.selectList("reviewns.movieReviewList", movNum);
	}

	@Override
	public List<Review> tvReviewList(int tvNum) {
		return sst.selectList("reviewns.tvReviewList", tvNum);
	}

	@Override
	public int tvUpdateNoSpoiler(Review review) {
		return sst.update("reviewns.tvUpdateNoSpoiler", review);
	}

	@Override
	public int tvUpdateSpoiler(Review review) {
		return sst.update("reviewns.tvUpdateSpoiler", review);
	}

	@Override
	public Review select(int reviewNum) {
		return sst.selectOne("reviewns.select", reviewNum);
	}

	@Override
	public int likeUp(int reviewNum) {
		return sst.update("reviewns.likeUp", reviewNum);
	}

	@Override
	public int likeDown(int reviewNum) {
		return sst.update("reviewns.likeDown", reviewNum);
	}

	@Override
	public Review select2(String email) {
		return sst.selectOne("reviewns.select2", email);
	}

	@Override
	public int selectLikeChk(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.selectOne("reviewns.selectLikeChk", hm);
	}

	@Override
	public int countLikeChk(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.selectOne("reviewns.countLikeChk", hm);
	}

	@Override
	public List<Review> movieReviewList(int movNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("movNum", movNum);
		hm.put("email", email);
		return sst.selectList("reviewns.movieReviewList2", hm);
	}

	@Override
	public List<Review> tvReviewList(int tvNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("tvNum", tvNum);
		hm.put("email", email);
		return sst.selectList("reviewns.tvReviewList2", hm);
	}

	@Override
	public int pointUp(String email) {
		return sst.update("pmemberns.pointUp", email);
	}

	@Override
	public int countMovie(String email) {
		return sst.selectOne("reviewns.countMovie", email);
	}

	@Override
	public int countTv(String email) {
		return sst.selectOne("reviewns.countTv", email);
	}

	@Override
	public int preReviewCount(String email) {
		return sst.selectOne("reviewns.preReviewCount", email);
	}

	@Override
	public List<Review> preGenre(String email) {
		return sst.selectList("reviewns.preGenre", email);
	}

	@Override
	public List<Review> everRateMovie(int movNum) {
		return sst.selectList("reviewns.everRateMovie", movNum);
	}

	@Override
	public int everRateCountMovie(int movNum) {
		return sst.selectOne("reviewns.everRateCountMovie", movNum);
	}

	@Override
	public List<Review> everRateTv(int tvNum) {
		return sst.selectList("reviewns.everRateTv", tvNum);
	}

	@Override
	public int everRateCountTv(int tvNum) {
		return sst.selectOne("reviewns.everRateCountTv", tvNum);
	}

	@Override
	public double rateAvg(String email) {
		return sst.selectOne("reviewns.rateAvg", email);
	}

	@Override
	public int rateCnt(String email) {
		return sst.selectOne("reviewns.rateCnt", email);
	}

	@Override
	public double mostRating(String email) {
		return sst.selectOne("reviewns.mostRating", email);
	}

}
