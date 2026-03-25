{userSettings, ...}: {
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      useQuicCss = true;
      plugins = {
        alwaysAnimate.enabled = true;
        alwaysTrust.enabled = true;
        anonymiseFileNames = {
          enabled = true;
          anonymiseByDefault = true;
        };
        betterGifPicker.enabled = true;
        betterRoleContext.enabled = true;
        betterSettings.enabled = true;
        blurNSFW.enabled = false;
        callTimer.enabled = true;
        clearURLs.enabled = true;
        copyUserURLs.enabled = true;
        dearrow.enabled = true;
        disableCallIdle.enabled = true;
        experiments.enabled = true;
        fakeNitro.enabled = true;
        favoriteEmojiFirst.enabled = true;
        fixCodeblockGap.enabled = true;
        fixImagesQuality.enabled = true;
        fixSpotifyEmbeds.enabled = true;
        fixYoutubeEmbeds.enabled = true;
        forceOwnerCrown.enabled = true;
        friendsSince.enabled = true;
        fullSearchContext.enabled = true;
        iLoveSpam.enabled = true;
        memberCount.enabled = true;
        mentionAvatars = {
          enabled = true;
          showAtSymbol = false;
        };
        noOnboardingDelay.enabled = true;
        noTypingAnimation.enabled = true;
        openInApp = {
          enabled = true;
          spotify = true;
          steam = true;
          tidal = true;
          itunes = true;
        };
        petpet.enabled = true;
        pictureInPicture.enabled = true;
        serverInfo.enabled = true;
        serverListIndicators.enabled = true;
        showHiddenChannels.enabled = true;
        showHiddenThings.enabled = true;
        silentTyping = {
          enabled = true;
          showIcon = true;
        };
        spotifyCrack.enabled = true;
        startupTimings.enabled = true;
        typingTweaks.enabled = true;
        voiceChatDoubleClick.enabled = true;
        voiceDownload.enabled = true;
        voiceMessages.enabled = true;
        youtubeAdblock.enabled = true;
      };
    };
  };
}
