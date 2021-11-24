package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.ReviewDao;
import com.ch.project.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao rd;

	@Override
	public Review selectMovReview(String email, int movNum) {
		return rd.selectMovReview(email, movNum);
	}

	@Override
	public Review selectTvReview(String email, int tvNum) {
		return rd.selectTvReview(email, tvNum);
	}

	@Override
	public int tvReviewRateInsert(String email, int reviewRate, int tvNum) {
		return rd.tvReviewRateInsert(email, reviewRate, tvNum);
	}

	@Override
	public int reviewRateUpdate(int reviewRate, int reviewNum) {
		return rd.reviewRateUpdate(reviewRate, reviewNum);
	}

	@Override
	public int movReviewRateInsert(String email, int reviewRate, int movNum) {
		return rd.movReviewRateInsert(email, reviewRate, movNum);
	}

	// 리뷰 코멘트 등록, 수정 (스포 X)
	@Override
	public int writeCommentFirst(Review review) {
		return rd.writeCommentFirst(review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 O)
	@Override
	public int writeCommentSpoilerFirst(Review review) {
		return rd.writeCommentSpoilerFirst(review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 X)
	@Override
	public int writeComment(Review review) {
		return rd.writeComment(review);
	}

	// 리뷰 코멘트 등록, 수정 (스포 O)
	@Override
	public int writeCommentSpoiler(Review review) {
		return rd.writeCommentSpoiler(review);
	}

	// 리뷰 코멘트 삭제
	@Override
	public int deleteComment(int reviewNum) {
		return rd.deleteComment(reviewNum);
	}

	@Override
	public List<Review> hashTvList(int hashNum) {
		return rd.hashTvList(hashNum);
	}

	@Override
	public List<Review> hashMoList(int hashNum) {
		return rd.hashMoList(hashNum);
	}

	@Override
	public List<Review> list(String email, int startRow, int endRow) {
		return rd.list(email, startRow, endRow);
	}

	@Override
	public int total(String email) {
		return rd.total(email);
	}

	@Override
	public List<Review> list2(String email, int startRow, int endRow) {
		return rd.list2(email, startRow, endRow);
	}

	@Override
	public List<Review> movieReviewList(int movNum) {
		return rd.movieReviewList(movNum);
	}

	@Override
	public List<Review> movieReviewList(int movNum, String email) {
		return rd.movieReviewList(movNum, email);
	}

	@Override
	public List<Review> tvReviewList(int tvNum) {
		return rd.tvReviewList(tvNum);
	}

	@Override
	public List<Review> tvReviewList(int tvNum, String email) {
		return rd.tvReviewList(tvNum, email);
	}

	@Override
	public Review select(int reviewNum) {
		return rd.select(reviewNum);
	}

	@Override
	public int likeUp(int reviewNum) {
		return rd.likeUp(reviewNum);
	}

	@Override
	public int likeDown(int reviewNum) {
		return rd.likeDown(reviewNum);
	}

	@Override
	public Review select2(String email) {
		return rd.select2(email);
	}

	@Override
	public int selectLikeChk(int reviewNum, String email) {
		return rd.selectLikeChk(reviewNum, email);
	}

	@Override
	public int countLikeChk(int reviewNum, String email) {
		return rd.countLikeChk(reviewNum, email);
	}

	@Override
	public int pointUp(String email) {
		return rd.pointUp(email);
	}

	@Override
	public int countMovie(String email) {
		return rd.countMovie(email);
	}

	@Override
	public int countTv(String email) {
		return rd.countTv(email);
	}

	@Override
	public int preReviewCount(String email) {
		return rd.preReviewCount(email);
	}

	@Override
	public List<Review> preGenre(String email) {
		return rd.preGenre(email);
	}

	@Override
	public List<Review> everRateMovie(int movNum) {
		return rd.everRateMovie(movNum);
	}

	@Override
	public int everRateCountMovie(int movNum) {
		return rd.everRateCountMovie(movNum);
	}

	@Override
	public List<Review> everRateTv(int tvNum) {
		return rd.everRateTv(tvNum);
	}

	@Override
	public int everRateCountTv(int tvNum) {
		return rd.everRateCountTv(tvNum);
	}

	@Override
	public double rateAvg(String email) {
		return rd.rateAvg(email);
	}

	@Override
	public int rateCnt(String email) {
		return rd.rateCnt(email);
	}

	@Override
	public double mostRating(String email) {
		return rd.mostRating(email);
	}

}
