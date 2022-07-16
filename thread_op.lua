-- local aliases for globals
local TEXT_SIZE_LARGE = redditisfun.TEXT_SIZE_LARGE
local TEXT_SIZE_MEDIUM = redditisfun.TEXT_SIZE_MEDIUM
local TEXT_SIZE_SMALL = redditisfun.TEXT_SIZE_SMALL
local TEXT_COLOR_SECONDARY = redditisfun.TEXT_COLOR_SECONDARY
local SELECTABLE_ITEM_BACKGROUND = redditisfun.SELECTABLE_ITEM_BACKGROUND
local Fonts = redditisfun.Fonts
local Spans = redditisfun.Spans

-- action strings
local SHARE_TEXT = "share"
local SAVE_TEXT = "save"
local UNSAVE_TEXT = "unsave"
local HIDE_TEXT = "hide"
local UNHIDE_TEXT = "unhide"
local MORE_TEXT = "more"
local COMMENTS_TEXT = "comments"

-- drawables
local DRAWABLE_UNSAVE = "btn_star_on_normal_holo_light.png"
local DRAWABLE_SAVE = "btn_star_off_normal_holo_light.png"
local DRAWABLE_VOTE_UP_GRAY = "vote_up_gray.png"
local DRAWABLE_VOTE_DOWN_GRAY = "vote_down_gray.png"
local DRAWABLE_VOTE_UP_RED = "vote_up_red.png"
local DRAWABLE_VOTE_DOWN_BLUE = "vote_down_blue.png"
local DRAWABLE_SHARE = "ic_menu_share_plain_holo_light.png"
local DRAWABLE_HIDE = "content_remove_holo_light.png"
local DRAWABLE_MORE = "ic_menu_moreoverflow_normal_holo_light.png"
local DRAWABLE_COMMENTS = "social_chat_holo_light.png"
local DRAWABLE_THUMBNAIL_DEFAULT = "thumbnail_default.png"
local DRAWABLE_THUMBNAIL_NSFW = "thumbnail_nsfw.png"
local DRAWABLE_THUMBNAIL_SELF = "thumbnail_self.png"
local DRAWABLE_IMAGE_LINK = "content_picture_holo_light.png"
local DRAWABLE_WEB_LINK = "location_web_site_holo_light.png"

-- http://colllor.com/33b5e5
local CHECKED_BGCOLOR = "#DBF2FA"

local CLICKED_BGCOLOR = "#EBEBEB"
--local THUMBNAIL_BGCOLOR = "#DEDEDE"
local THUMBNAIL_BGCOLOR = ""

local TEXT_COLOR_GILDED = "#99895F"

local TEXT_SIZE_BODY   = TEXT_SIZE_SMALL * 1.1
local TEXT_SIZE_GILDED = TEXT_SIZE_SMALL * 0.9

---
-- @usage exported
function newView(Builder)
    local view1 = Builder:beginLinearLayout("root")
    view1:setLayoutSize("fill_parent", "wrap_content")
    view1:setOrientation("vertical")
    view1:setMinHeight("70dp")
    view1:setDescendantFocusability("blocksDescendants")
    
        local view2 = Builder:beginLinearLayout("view2")
        -- NOT CURRENTLY SUPPORTED: android:baselineAligned="false"
        view2:setLayoutSize("fill_parent", "wrap_content")
        view2:setOrientation("horizontal")
    
            -- vote
            local frame = Builder:beginFrameLayout()
            frame:setLayoutSize("wrap_content", "70dp")
                local lin = Builder:beginLinearLayout()
                lin:setOrientation("vertical")
                lin:setLayoutSize("wrap_content", "64dp")
                    local voteUp = Builder:beginFrameLayout("vote_up_button")
                    voteUp:setLayoutSize("40dp", "wrap_content")
                    voteUp:setLayoutWeight(1.0)
                    voteUp:setBackground(SELECTABLE_ITEM_BACKGROUND)
                    voteUp:setOnClick("voteUp")
                    Builder:endViewGroup()
    
                    local voteDown = Builder:beginFrameLayout("vote_down_button")
                    voteDown:setLayoutSize("40dp", "wrap_content")
                    voteDown:setLayoutWeight(1.0)
                    voteDown:setBackground(SELECTABLE_ITEM_BACKGROUND)
                    voteDown:setOnClick("voteDown")
                    Builder:endViewGroup()
                Builder:endViewGroup()
    
                local lin = Builder:beginLinearLayout()
                lin:setOrientation("vertical")
                lin:setLayoutSize("wrap_content", "64dp")
                lin:setPaddingBottom("8dp")
                lin:setPaddingTop("8dp")
    
                    local image = Builder:addImageView("vote_up_image")
                    image:setLayoutSize("16dp", "8dp")
                    image:setLayoutMarginLeft("12dp")
                    image:setLayoutMarginRight("12dp")
                    image:setDrawable(DRAWABLE_VOTE_UP_GRAY)
    
                    local tv = Builder:addTextView("votes")
                    tv:setLayoutSize("40dp", "32dp")
                    tv:setGravity("center")
                    tv:setSingleLine()
                    tv:setTextSize("14sp")
                    tv:setTextStyle("bold")
    
                    local image = Builder:addImageView("vote_down_image")
                    image:setLayoutSize("16dp", "8dp")
                    image:setLayoutMarginLeft("12dp")
                    image:setLayoutMarginRight("12dp")
                    image:setDrawable(DRAWABLE_VOTE_DOWN_GRAY)
    
                Builder:endViewGroup()
            Builder:endViewGroup()
    
            local thread_info_layout = Builder:beginLinearLayout("thread_info_layout")
            thread_info_layout:setLayoutSize("0dp", "wrap_content")
            thread_info_layout:setLayoutWeight(1.000000)
            thread_info_layout:setOrientation("vertical")
            thread_info_layout:setMinHeight("70dp")
            thread_info_layout:setBackground(SELECTABLE_ITEM_BACKGROUND)
            thread_info_layout:setPaddingLeft("5dip")
            thread_info_layout:setPaddingTop("2dip")
            thread_info_layout:setPaddingBottom("2dip")
            thread_info_layout:setOnClick("clickThread")
                local title = Builder:addTextView("title")
                title:setLayoutSize("wrap_content", "wrap_content")
                title:setLayoutMarginBottom("1dip")
                title:setText("Placeholder title")
                title:setTextSize(TEXT_SIZE_LARGE)
    
                local view5 = Builder:beginLinearLayout("view5")
                view5:setLayoutSize("wrap_content", "wrap_content")
                view5:setOrientation("horizontal")
                    local num_reports = Builder:addTextView("num_reports")
                    num_reports:setLayoutSize("wrap_content", "wrap_content")
                    num_reports:setLayoutMarginRight("5dip")
                    num_reports:setText("2 reports")
                    num_reports:setTextSize(TEXT_SIZE_SMALL)
                    num_reports:setTextColor(TEXT_COLOR_SECONDARY)
                    num_reports:setTextColor("#ffF88017")
                    num_reports:setSingleLine()
                    local nsfw = Builder:addTextView("nsfw")
                    nsfw:setLayoutSize("wrap_content", "wrap_content")
                    nsfw:setLayoutMarginRight("5dip")
                    nsfw:setText("nsfw")
                    nsfw:setTextSize(TEXT_SIZE_SMALL)
                    nsfw:setTextColor(TEXT_COLOR_SECONDARY)
                    nsfw:setTextColor("#ffff0000")
                    nsfw:setSingleLine()
                    local num_comments = Builder:addTextView("num_comments")
                    num_comments:setLayoutSize("wrap_content", "wrap_content")
                    num_comments:setLayoutGravity("left")
                    num_comments:setLayoutMarginRight("5dip")
                    num_comments:setText("9999 comments")
                    num_comments:setTextSize(TEXT_SIZE_SMALL)
                    num_comments:setTextColor(TEXT_COLOR_SECONDARY)
                    num_comments:setSingleLine()
                    local subreddit = Builder:addTextView("subreddit")
                    subreddit:setLayoutSize("wrap_content", "wrap_content")
                    subreddit:setLayoutGravity("left")
                    subreddit:setLayoutMarginRight("5dip")
                    subreddit:setText("TwoXChromosomes")
                    subreddit:setTextSize(TEXT_SIZE_SMALL)
                    subreddit:setTextColor(TEXT_COLOR_SECONDARY)
                    subreddit:setSingleLine()
                Builder:endViewGroup()
    
                local view10 = Builder:beginLinearLayout("view10")
                view10:setLayoutSize("wrap_content", "wrap_content")
                view10:setOrientation("horizontal")
                view10:setGravity("center_vertical")
                    local submission_time = Builder:addTextView("submission_time")
                    submission_time:setLayoutSize("wrap_content", "wrap_content")
                    submission_time:setLayoutMarginRight("4dip")
                    submission_time:setTextSize(TEXT_SIZE_SMALL)
                    submission_time:setTextColor(TEXT_COLOR_SECONDARY)
                    submission_time:setSingleLine()
                    local submitter = Builder:addTextView("submitter")
                    submitter:setLayoutSize("wrap_content", "wrap_content")
                    submitter:setLayoutMarginRight("5dip")
                    submitter:setTextSize(TEXT_SIZE_SMALL)
                    submitter:setTextColor(TEXT_COLOR_SECONDARY)
                    submitter:setSingleLine()
                    local submitter_distinguished_mod = Builder:addTextView("submitter_distinguished_mod")
                    submitter_distinguished_mod:setLayoutSize("wrap_content", "wrap_content")
                    submitter_distinguished_mod:setVisibility("gone")
                    submitter_distinguished_mod:setText("[M]")
                    submitter_distinguished_mod:setTextSize(TEXT_SIZE_SMALL)
                    submitter_distinguished_mod:setTextColor("#ff228822")
                    submitter_distinguished_mod:setSingleLine(true)
                    local submitter_distinguished_admin = Builder:addTextView("submitter_distinguished_admin")
                    submitter_distinguished_admin:setLayoutSize("wrap_content", "wrap_content")
                    submitter_distinguished_admin:setVisibility("gone")
                    submitter_distinguished_admin:setText("[A]")
                    submitter_distinguished_admin:setTextSize(TEXT_SIZE_SMALL)
                    submitter_distinguished_admin:setTextColor("#ffff0011")
                    submitter_distinguished_admin:setSingleLine(true)
                    local submitter_distinguished_special = Builder:addTextView("submitter_distinguished_special")
                    submitter_distinguished_special:setLayoutSize("wrap_content", "wrap_content")
                    submitter_distinguished_special:setVisibility("gone")
                    submitter_distinguished_special:setText("[Δ]")
                    submitter_distinguished_special:setTextSize(TEXT_SIZE_SMALL)
                    submitter_distinguished_special:setTextColor("#BE1337")
                    submitter_distinguished_special:setSingleLine(true)

                    local user_flair = Builder:addTextView("user_flair")
                    user_flair:setLayoutSize("wrap_content", "wrap_content")
                    user_flair:setLayoutMarginRight("5dip")
                    user_flair:setVisibility("gone")
                    user_flair:setTextSize(TEXT_SIZE_SMALL)
                    user_flair:setTextColor(TEXT_COLOR_SECONDARY)
                    user_flair:setBackground("#dfdfdf")
                    user_flair:setEllipsize("end")
                    user_flair:setSingleLine(true)

                    local thread_gild_icon = Builder:addImageView("thread_gild_icon")
                    thread_gild_icon:setLayoutSize("13dp", "14dp")
                    thread_gild_icon:setLayoutGravity("center")
                    thread_gild_icon:setLayoutMarginRight("1dp")
                    thread_gild_icon:setScaleType("fitCenter")
                    thread_gild_icon:setDrawable("comment_gild.png")
                    local thread_gild_text = Builder:addTextView("thread_gild_text")
                    thread_gild_text:setLayoutSize("wrap_content", "wrap_content")
                    thread_gild_text:setTextColor(TEXT_COLOR_GILDED)
                    thread_gild_text:setTextSize(TEXT_SIZE_GILDED)
                    thread_gild_text:setSingleLine()
                Builder:endViewGroup()
    
            Builder:endViewGroup()
    
            local frame = Builder:beginFrameLayout()
            frame:setLayoutSize("wrap_content", "fill_parent")
            frame:setBackground(THUMBNAIL_BGCOLOR)
                local frame = Builder:beginFrameLayout("thumbnail_frame")
                frame:setLayoutSize("wrap_content", "fill_parent")
                frame:setBackground(SELECTABLE_ITEM_BACKGROUND)
                frame:setOnClick("clickThumbnail")
                
                    local image = Builder:addImageView("thumbnail_image")
                    image:setLayoutSize("70dp", "70dp")
                    
                    local lin = Builder:beginLinearLayout("thumbnail_icon_frame")
                    lin:setOrientation("vertical")
                    lin:setLayoutSize("70dp", "70dp")
                    lin:setVisibility("gone")
                    lin:setGravity("center")
                        local image = Builder:addImageView("thumbnail_icon")
                        image:setLayoutSize("32dp", "32dp")
                        
                        local label = Builder:addTextView("thumbnail_icon_label")
                        label:setLayoutSize("wrap_content", "wrap_content")
                        label:setTextSize("12sp")
                    Builder:endLinearLayout()
        
                    local progressBar = Builder:addProgressBar("thumbnail_progress")
                    progressBar:setLayoutSize("70dp", "70dp")
                    progressBar:setIndeterminate()
                    progressBar:setVisibility("gone")
                Builder:endFrameLayout()
            Builder:endFrameLayout()
        Builder:endViewGroup()
    
        local selftext = Builder:addTextView("selftext")
        selftext:setLayoutSize("fill_parent", "wrap_content")
        selftext:setLayoutMarginLeft("8dip")
        selftext:setLayoutMarginRight("8dip")
        selftext:setBackground("selftext_border.9.png")
        selftext:setPadding("8dp")
        selftext:setTextSize(TEXT_SIZE_BODY)
        selftext:setTextColor("#0a0a0a")
        selftext:setOnClick("onListItemClick")
        selftext:setClickable(true)
        selftext:setLinksClickable(true)
        selftext:setHasContextMenu(true)
    
    Builder:endViewGroup()
    
    Fonts:registerNormal("Roboto", "fonts/Roboto-Regular.ttf")
    Fonts:registerBold("Roboto", "fonts/Roboto-Bold.ttf")
    Fonts:registerItalic("Roboto", "fonts/Roboto-Italic.ttf")
    Fonts:registerBoldItalic("Roboto", "fonts/Roboto-BoldItalic.ttf")
    view1:setTypeface("Roboto")
        
end

local function bindTitleAndDomain(textView, Thing)
    local flairBackgroundColor = "#dddddd"
    local flairSize = TEXT_SIZE_SMALL
    local titleColor = (Thing:isStickied() and "#669900" or (Thing:isClicked() and "#551a8b" or "#0000ff"))
    local titleStyle = ((Thing:isClicked() and not Thing:isStickied()) and "normal" or "bold")
    local domainColor = "#7f7f7f"
    local domainSize = TEXT_SIZE_SMALL
    
    -- link flair
    local thingLinkFlairText = Thing:getLink_flair_text()
    local hasFlair = thingLinkFlairText and "" ~= thingLinkFlairText
    local flairBuilder
    if hasFlair then
        flairBuilder = Spans:addSize(thingLinkFlairText, flairSize)
        flairBuilder = Spans:addBackgroundColor(flairBuilder, flairBackgroundColor)
    else
        flairBuilder = Spans:builder()  -- empty SpannableStringBuilder
    end
    
    -- title
    local titleBuilder = Spans:addColor(Thing:getTitle(), titleColor)
    titleBuilder = Spans:addStyle(titleBuilder, titleStyle)
    
    -- domain
    local domainBuilder = Spans:addColor("(" .. Thing:getDomain() .. ")", domainColor)
    domainBuilder = Spans:addSize(domainBuilder, domainSize)
    
    -- combine
    textView:setText(flairBuilder:append(hasFlair and " " or ""):append(titleBuilder):append(" "):append(domainBuilder))
end

local function getDefaultThumbnail(thumbnailUrl)
    if not thumbnailUrl then
        return nil
    elseif thumbnailUrl:sub(-7) == "default" then
        return DRAWABLE_THUMBNAIL_DEFAULT
    elseif thumbnailUrl:sub(-4) == "nsfw" then
        return DRAWABLE_THUMBNAIL_NSFW
    elseif thumbnailUrl:sub(-4) == "self" then
        return DRAWABLE_THUMBNAIL_SELF
    end
end

---
-- get the label text for image links
local function getImageLabelText(urlLower)
    local last4 = urlLower:sub(-4)
    if last4 == ".jpg" or last4 == ".gif" or last4 == ".png" then
        return last4:sub(2)
    elseif urlLower:sub(-5) == ".jpeg" then
        return "jpg"
    elseif urlLower:sub(1, 17) == "http://imgur.com/" or urlLower:sub(1, 19) == "http://i.imgur.com/" then
        return "imgur"
    else
        return nil
    end
end

---
-- @usage exported
function bindView(Holder, Thing, ListItem)

    bindTitleAndDomain(Holder:getView("title"), Thing)
    
    -- votes
    local votes = Holder:getView("votes")
    local upArrow = Holder:getView("vote_up_image")
    local downArrow = Holder:getView("vote_down_image")
    local thingScore = Thing:getScore()
    local thingLikes = Thing:getLikes()
    votes:setText(tostring(thingScore >= 0 and thingScore or 0))
    if thingLikes == true then
        local colorArrowRed = "#ffff8b60"
        votes:setTextColor(colorArrowRed)
        upArrow:setDrawable(DRAWABLE_VOTE_UP_RED)
        downArrow:setDrawable(DRAWABLE_VOTE_DOWN_GRAY)
    elseif thingLikes == false then
        local colorArrowBlue = "#ff9494ff"
        votes:setTextColor(colorArrowBlue)
        upArrow:setDrawable(DRAWABLE_VOTE_UP_GRAY)
        downArrow:setDrawable(DRAWABLE_VOTE_DOWN_BLUE)
    else -- thingLikes == nil
        local colorArrowGray = "#ffc0c0c0"
        votes:setTextColor(colorArrowGray)
        upArrow:setDrawable(DRAWABLE_VOTE_UP_GRAY)
        downArrow:setDrawable(DRAWABLE_VOTE_DOWN_GRAY)
    end
    
    local num_reports = Holder:getView("num_reports")
    local thingNumReports = Thing:getNum_reports()
    local hasReports = thingNumReports ~= nil and thingNumReports > 0
    num_reports:setVisible(hasReports)
    if hasReports then
        num_reports:setText(string.format(thingNumReports==1 and "%d report" or "%d reports", thingNumReports))
    end

    local thingNumComments = Thing:getNum_comments()
    Holder:getView("nsfw"):setVisible(Thing:isOver_18())
    Holder:getView("num_comments"):setText(string.format(thingNumComments==1 and "%d comment" or "%d comments", thingNumComments))
    Holder:getView("subreddit"):setText(Thing:getSubreddit())
    Holder:getView("submission_time"):setText(Thing:getCreatedTimeAgo())
    Holder:getView("submitter"):setText("by "..Thing:getAuthor())
    Holder:getView("submitter_distinguished_mod"):setVisible(Thing:isModerator())
    Holder:getView("submitter_distinguished_admin"):setVisible(Thing:isAdmin())
    Holder:getView("submitter_distinguished_special"):setVisible(Thing:isSpecialAdmin())
    
    -- thumbnail
    local thumbnail = Holder:getView("thumbnail_image")
    local thumbnail_icon_frame = Holder:getView("thumbnail_icon_frame")
    local thumbnail_icon = Holder:getView("thumbnail_icon")
    local thumbnail_icon_label = Holder:getView("thumbnail_icon_label")
    local thumbnail_progress = Holder:getView("thumbnail_progress")
    local thingThumbnail = Thing:getThumbnail()
    local defaultThumbnail = getDefaultThumbnail(thingThumbnail)
    if defaultThumbnail then
        thumbnail:setVisibility("visible")
        thumbnail_icon_frame:setVisibility("gone")
        thumbnail:setDrawable(defaultThumbnail)
    elseif thingThumbnail == "" then
        if Thing:isIs_self() then
            thumbnail:setVisibility("visible")
            thumbnail_icon_frame:setVisibility("gone")
            thumbnail:setDrawable(DRAWABLE_THUMBNAIL_SELF)
        else    
            thumbnail:setVisibility("gone")
            thumbnail_icon_frame:setVisibility("visible")
            local urlLower = Thing:getUrl():lower()
            local imageLabelText = getImageLabelText(urlLower)
            if imageLabelText then
                thumbnail_icon:setDrawable(DRAWABLE_IMAGE_LINK)
                thumbnail_icon_label:setVisibility("visible")
                thumbnail_icon_label:setText(imageLabelText)
            else
                thumbnail_icon:setDrawable(DRAWABLE_WEB_LINK)
                
                local isReddit =
                    urlLower:sub(1, 18) == "http://reddit.com/" or
                    urlLower:sub(1, 15) == "http://redd.it/" or
                    urlLower:find("http://[^./]+%.reddit%.com/") ~= nil
                
                if isReddit then
                    thumbnail_icon_label:setVisibility("visible")
                    thumbnail_icon_label:setText("reddit")
                else                    
                    thumbnail_icon_label:setVisibility("gone")
                end
            end
        end
    else
        thumbnail_icon_frame:setVisibility("gone")
        -- displayThumbnailImageWithProgress will handle visibility of thumbnail and thumbnail_progress
        thumbnail:displayThumbnailImageWithProgress(thingThumbnail, thumbnail_progress)
    end

    -- flair
    local userFlairView = Holder:getView("user_flair")
    local userFlair
    local userFlairText = Thing:getAuthor_flair_text()
    local userFlairCssClass = Thing:getAuthor_flair_css_class()
    if userFlairText ~= nil and "" ~= userFlairText then
        userFlair = userFlairText
    elseif (userFlairCssClass ~= nil and "" ~= userFlairCssClass) then
        userFlair = userFlairCssClass
    else
        userFlair = nil
    end

    if userFlair ~= nil then
        userFlairView:setVisible(true)
        userFlairView:setText(userFlair)
    else
        userFlairView:setVisible(false)
    end

    local gildedCount = Thing:getGilded()
    Holder:getView("thread_gild_icon"):setVisible(gildedCount > 0)
    if gildedCount > 1 then
        Holder:getView("thread_gild_text"):setText("x" .. gildedCount)
    else
        Holder:getView("thread_gild_text"):setText("")
    end

    -- selftext
    local selftext = Holder:getView("selftext")
    local thingRenderedSelftext = Thing:getRenderedSelftext()
    local thingSelftext = Thing:getSelftext()
    if thingRenderedSelftext then
        selftext:setText(thingRenderedSelftext)
    else
        selftext:setText(thingSelftext)
    end
    selftext:setVisible(thingSelftext and "" ~= thingSelftext)
    selftext:setMovementMethod("LinkMovementMethod")
    
end

