package org.baeldung.web.schedule;

import java.util.Date;
import java.util.List;

import org.baeldung.persistence.dao.PostRepository;
import org.baeldung.persistence.model.Post;
import org.baeldung.persistence.service.IPostRedditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class RedditScheduler {

    @Autowired
    private IPostRedditService service;

    @Autowired
    private PostRepository postReopsitory;

    @Scheduled(fixedRate = 1 * 60 * 1000)
    public void schedulePosts() {
        final List<Post> posts = postReopsitory.findBySubmissionDateBeforeAndIsSent(new Date(), false);
        for (final Post post : posts) {
            service.submitPost(post);
        }
    }

    @Scheduled(fixedRate = 3 * 60 * 1000)
    public void checkAndReSubmitPosts() {
        final List<Post> submitted = postReopsitory.findByRedditIDNotNullAndNoOfAttemptsGreaterThan(0);
        for (final Post post : submitted) {
            service.checkAndReSubmit(post);
        }
    }

    @Scheduled(fixedRate = 3 * 60 * 1000)
    public void checkAndDeleteAfterLastAttempt() {
        final List<Post> submitted = postReopsitory.findByRedditIDNotNullAndNoOfAttemptsAndDeleteAfterLastAttemptTrue(0);
        for (final Post post : submitted) {
            service.checkAndDelete(post);
        }
    }

}
