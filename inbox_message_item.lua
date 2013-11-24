-- local aliases for globals
local TEXT_SIZE_LARGE = redditisfun.TEXT_SIZE_LARGE
local TEXT_SIZE_MEDIUM = redditisfun.TEXT_SIZE_MEDIUM
local TEXT_SIZE_SMALL = redditisfun.TEXT_SIZE_SMALL
local TEXT_COLOR_PRIMARY = redditisfun.TEXT_COLOR_PRIMARY
local TEXT_COLOR_SECONDARY = redditisfun.TEXT_COLOR_SECONDARY
local SELECTABLE_ITEM_BACKGROUND = redditisfun.SELECTABLE_ITEM_BACKGROUND
local Fonts = redditisfun.Fonts
local Spans = redditisfun.Spans
local Toasts = redditisfun.Toasts

local TEXT_SIZE_BODY = TEXT_SIZE_SMALL * 1.1
local TEXT_COLOR_NEW = "#ff0000"
local TEXT_COLOR_OLD = TEXT_COLOR_PRIMARY

-- http://colllor.com/33b5e5
local CHECKED_BGCOLOR = "#DBF2FA"

---
-- @usage exported
function newView(Builder)
    local view1 = Builder:beginLinearLayout("view1")
    view1:setLayoutSize("fill_parent", "wrap_content")
    view1:setOrientation("horizontal")
		local function addIndent(viewId)
			local left_indent = Builder:addView(viewId)
			left_indent:setLayoutSize("1dp", "fill_parent")
			left_indent:setLayoutMarginLeft("5dp")
			left_indent:setLayoutMarginRight("4dp")
			left_indent:setBackground("#ffdfdfdf")
		end
		
		addIndent("left_indent1")
		addIndent("left_indent2")
		addIndent("left_indent3")
		addIndent("left_indent4")
		addIndent("left_indent5")
		addIndent("left_indent6")
		addIndent("left_indent7")
		addIndent("left_indent8")
        
        local view2 = Builder:beginLinearLayout("view2")
        view2:setLayoutSize("fill_parent", "wrap_content")
        view2:setOrientation("vertical")
        view2:setPadding("5dp", "4dp", "5dp", "4dp")
            
            local content = Builder:beginFrameLayout("content")
            content:setLayoutSize("fill_parent", "wrap_content")
            content:setPadding("4dp")
            content:setOnClick("onListItemClick")
            content:setClickable(true)
                local collapse = Builder:addImageButton("collapse")
                collapse:setLayoutSize("wrap_content", "wrap_content")
                collapse:setLayoutGravity("top|right")
                collapse:setBackground(SELECTABLE_ITEM_BACKGROUND)
                collapse:setVisibility("gone")
                collapse:setOnClick("hideComment")
                collapse:setDrawable("navigation_collapse_holo_light.png")
                collapse:setScaleType("fitCenter")
                
                local view5 = Builder:beginLinearLayout("view5")
                view5:setLayoutSize("fill_parent", "wrap_content")
                view5:setOrientation("vertical")
                    
                    local view6 = Builder:beginLinearLayout("view6")
                    view6:setLayoutSize("wrap_content", "wrap_content")
                    view6:setLayoutMarginBottom("2dip")
                    view6:setOrientation("horizontal")
                        local subject = Builder:addTextView("subject")
                        subject:setLayoutSize("wrap_content", "wrap_content")
                        subject:setLayoutMarginRight("5dip")
                        subject:setTextSize(TEXT_SIZE_MEDIUM)
                        subject:setTextStyle("bold")
                        local post_title = Builder:addTextView("post_title")
                        post_title:setLayoutSize("wrap_content", "wrap_content")
                        post_title:setTextSize(TEXT_SIZE_MEDIUM)
                        post_title:setTextStyle("italic")
                    Builder:endLinearLayout()
                    
                    local view9 = Builder:beginLinearLayout("view9")
                    view9:setLayoutSize("wrap_content", "wrap_content")
                    view9:setOrientation("horizontal")
                        local from_user = Builder:addTextView("from_user")
                        from_user:setLayoutSize("wrap_content", "wrap_content")
                        from_user:setLayoutMarginRight("5dip")
                        from_user:setTextSize(TEXT_SIZE_SMALL)
                        from_user:setTextColor(TEXT_COLOR_SECONDARY)
                        from_user:setSingleLine(true)
                        local via_subreddit = Builder:addTextView("via_subreddit")
                        via_subreddit:setLayoutSize("wrap_content", "wrap_content")
                        via_subreddit:setLayoutMarginRight("5dip")
                        via_subreddit:setTextSize(TEXT_SIZE_SMALL)
                        via_subreddit:setTextColor(TEXT_COLOR_SECONDARY)
                        via_subreddit:setSingleLine(true)
                        local sent_time = Builder:addTextView("sent_time")
                        sent_time:setLayoutSize("wrap_content", "wrap_content")
                        sent_time:setLayoutMarginRight("5dip")
                        sent_time:setTextSize(TEXT_SIZE_SMALL)
                        sent_time:setTextColor(TEXT_COLOR_SECONDARY)
                        sent_time:setSingleLine(true)
                    Builder:endLinearLayout()
                    
                    local body = Builder:addTextView("body")
                    body:setLayoutSize("fill_parent", "wrap_content")
                    body:setBackground(SELECTABLE_ITEM_BACKGROUND)
                    body:setOnClick("onListItemClick")
					body:setClickable(true)
					body:setTextSize(TEXT_SIZE_BODY)
					body:setTextColor("#000000")
					body:setLinksClickable(true)
                Builder:endLinearLayout()
                
            Builder:endFrameLayout()
            
            local message_actions = Builder:beginLinearLayout("message_actions")
            message_actions:setLayoutSize("fill_parent", "wrap_content")
            message_actions:setLayoutMarginTop("5dp")
            message_actions:setOrientation("horizontal")
            message_actions:setGravity("center")
                local permalink = Builder:addImageButton("permalink")
                permalink:setLayoutSize("0dp", "32dp")
                permalink:setLayoutWeight(1.000000)
                permalink:setBackground(SELECTABLE_ITEM_BACKGROUND)
                permalink:setOnClick("permalinkMessage")
                permalink:setOnLongClick(function(v) Toasts:showHintShort("Permalink", v) end)
                permalink:setDrawable("ic_menu_share_plain_holo_light.png")
                permalink:setScaleType("fitCenter")
                local context = Builder:addImageButton("context")
                context:setLayoutSize("0dp", "32dp")
                context:setLayoutWeight(1.000000)
                context:setBackground(SELECTABLE_ITEM_BACKGROUND)
                context:setVisibility("gone")
                context:setOnClick("context")
                context:setOnLongClick(function(v) Toasts:showHintShort("Context", v) end)
                context:setDrawable("social_chat_holo_light.png")
                context:setScaleType("fitCenter")
                local vote_up_button = Builder:addImageButton("vote_up_button")
                vote_up_button:setLayoutSize("0dp", "32dp")
                vote_up_button:setLayoutWeight(1.000000)
                vote_up_button:setBackground(SELECTABLE_ITEM_BACKGROUND)
                vote_up_button:setOnClick("voteUp")
                vote_up_button:setOnLongClick(function(v) Toasts:showHintShort("Upvote", v) end)
                vote_up_button:setDrawable("up_arrow_holo_light.png")
                vote_up_button:setScaleType("fitCenter")
                local vote_down_button = Builder:addImageButton("vote_down_button")
                vote_down_button:setLayoutSize("0dp", "32dp")
                vote_down_button:setLayoutWeight(1.000000)
                vote_down_button:setBackground(SELECTABLE_ITEM_BACKGROUND)
                vote_down_button:setOnClick("voteDown")
                vote_down_button:setOnLongClick(function(v) Toasts:showHintShort("Downvote", v) end)
                vote_down_button:setDrawable("down_arrow_holo_light.png")
                vote_down_button:setScaleType("fitCenter")
                local more_actions = Builder:addImageButton("more_actions")
                more_actions:setLayoutSize("0dp", "32dp")
                more_actions:setLayoutWeight(1.000000)
                more_actions:setBackground(SELECTABLE_ITEM_BACKGROUND)
                more_actions:setOnClick("moreActionsMessage")
                more_actions:setOnLongClick(function(v) Toasts:showHintShort("More actions", v) end)
                more_actions:setDrawable("ic_menu_moreoverflow_normal_holo_light.png")
                more_actions:setScaleType("fitCenter")
                local mark_unread = Builder:addImageButton("mark_unread")
                mark_unread:setLayoutSize("0dp", "32dp")
                mark_unread:setLayoutWeight(1.000000)
                mark_unread:setBackground(SELECTABLE_ITEM_BACKGROUND)
                mark_unread:setOnClick("markUnread")
                mark_unread:setOnLongClick(function(v) Toasts:showHintShort("Mark unread", v) end)
                mark_unread:setDrawable("content_unread_holo_light.png")
                mark_unread:setScaleType("fitCenter")
                local reply = Builder:addImageButton("reply")
                reply:setLayoutSize("0dp", "32dp")
                reply:setLayoutWeight(1.000000)
                reply:setBackground(SELECTABLE_ITEM_BACKGROUND)
                reply:setOnClick("reply")
                reply:setOnLongClick(function(v) Toasts:showHintShort("Reply", v) end)
                reply:setDrawable("social_reply_holo_light.png")
                reply:setScaleType("fitCenter")
            Builder:endLinearLayout()
            
        Builder:endLinearLayout()
        
    Builder:endLinearLayout()
    
end

local function bindViewCommon(Holder, Thing, ListItem)
	local rootContainer = Holder:getView("view1")
	rootContainer:setBackground(ListItem:isChecked() and CHECKED_BGCOLOR or SELECTABLE_ITEM_BACKGROUND)
	
	-- indentation
	for i = 1,8 do
	    Holder:getView("left_indent" .. i):setVisible(Thing:getNestingLevel() >= i)
	end
    
    Holder:getView("message_actions"):setVisible(ListItem:isChecked())

    local subjectView = Holder:getView("subject")
    local subject = Thing:getSubject()
    if subject and subject ~= "" then
    	subjectView:setVisible(true)
    	subjectView:setText(subject)
	else
		subjectView:setVisible(false)
	end
	
	local fromUserView = Holder:getView("from_user")
	local author = Thing:getAuthor()
	local dest = Thing:getDest()
	if author and author ~= "" and dest and dest ~= "" then
		fromUserView:setVisible(true)
		if Thing:isCurrentUserAuthor() then
			fromUserView:setText("to " .. dest)
		else
			fromUserView:setText("from " .. author)
		end
	else
		fromUserView:setVisible(false)
	end
    
    local viaSubredditView = Holder:getView("via_subreddit")
    local subreddit = Thing:getSubreddit()
    if subreddit and subreddit ~= "" then
    	viaSubredditView:setVisible(true)
    	viaSubredditView:setText("/r/" .. subreddit)
	else
		viaSubredditView:setVisible(false)
	end
	
	local sentTimeView = Holder:getView("sent_time")
	sentTimeView:setText(Thing:getCreatedTimeAgo())
	
	local bodyView = Holder:getView("body")
	if Thing:getRenderedBody() then
		-- TODO catch ArrayIndexOutOfBoundsException
		-- JellyBean bug http://code.google.com/p/android/issues/detail?id=34872
		bodyView:setText(Thing:getRenderedBody())
	else
		bodyView:setText(Thing:getBody())
	end
	bodyView:setMovementMethod("LinkMovementMethod")
	bodyView:setClickable(true)
	bodyView:setLongClickable(false)

	local topLineTextColor = Thing:isNew() and TEXT_COLOR_NEW or TEXT_COLOR_OLD
	fromUserView:setTextColor(topLineTextColor)
	viaSubredditView:setTextColor(topLineTextColor)
	sentTimeView:setTextColor(topLineTextColor)
	
	Holder:getView("mark_unread"):setVisible(not Thing:isNew() and not Thing:isCurrentUserAuthor())
end

---
-- @usage exported
function bindViewMessage(Holder, Thing, ListItem)
    -- set click data for clickable elements that delegate to Java
    Holder:getView("content"):setClickData(Thing)
    Holder:getView("collapse"):setClickData(Thing)
    Holder:getView("body"):setClickData(Thing)
    Holder:getView("permalink"):setClickData(Thing)
    Holder:getView("more_actions"):setClickData(Thing)
    Holder:getView("mark_unread"):setClickData(Thing)
    Holder:getView("reply"):setClickData(Thing)
    
	-- indentation
	for i = 1,8 do
	    Holder:getView("left_indent" .. i):setVisible(Thing:getNestingLevel() >= i)
	end
    
    Holder:getView("message_actions"):setVisible(ListItem:isChecked())
    
    --
    -- message info
    --
    
    -- message has no context or vote buttons
    Holder:getView("context"):setVisible(false)
    Holder:getView("vote_up_button"):setVisible(false)
    Holder:getView("vote_down_button"):setVisible(false)
    
	-- collapse: only mod mail with replies
	local collapseView = Holder:getView("collapse")
	collapseView:setVisible(Thing:getReplies() ~= nil and subreddit ~= nil and subreddit ~= "");
	
	Holder:getView("permalink"):setVisible(true)
    
    bindViewCommon(Holder, Thing, ListItem)
end

---
-- @usage exported
function bindViewComment(Holder, Thing, ListItem)
    -- set click data for clickable elements that delegate to Java
    Holder:getView("content"):setClickData(Thing)
    Holder:getView("body"):setClickData(Thing)
    Holder:getView("permalink"):setClickData(Thing)
    Holder:getView("mark_unread"):setClickData(Thing)
    
    --
    -- inbox comment info
    --
    
    -- comments may have context
    local context = Holder:getView("context")
    context:setClickData(Thing)
    context:setVisible(true)
    context:setEnabled(Thing:getContext() and Thing:getContext() ~= "")
    
    local voteUpButton = Holder:getView("vote_up_button")
    local voteDownButton = Holder:getView("vote_down_button")
    local moreActions = Holder:getView("more_actions")
    local reply = Holder:getView("reply")
    voteUpButton:setClickData(Thing)
    voteDownButton:setClickData(Thing)
    moreActions:setClickData(Thing)
    reply:setClickData(Thing)
    
    -- comments cannot be acted on if deleted
    local canAct = not Thing:isDeleted()
    voteUpButton:setEnabled(canAct)
    voteDownButton:setEnabled(canAct)
    moreActions:setEnabled(canAct)
    reply:setEnabled(canAct)
    
    -- comments have vote
	voteUpButton:setDrawable(Thing:getLikes()==true and "up_arrow_red.png" or "up_arrow_holo_light.png")
	voteDownButton:setDrawable(Thing:getLikes()==false and "down_arrow_blue.png" or "down_arrow_holo_light.png")
	
	-- comments cannot be collapsed (only mod mail)
	Holder:getView("collapse"):setVisible(false)
	
	-- not enough info to get comment permalink inside inbox
	-- TODO double check
	Holder:getView("permalink"):setVisible(false)
   
    bindViewCommon(Holder, Thing, ListItem)
end
