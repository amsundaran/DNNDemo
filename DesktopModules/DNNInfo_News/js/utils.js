
function checkAll(id, obj) {
    var divObj = document.getElementById(id);
    if (divObj) {
        if (obj.checked) {
            for (i = 0; i < divObj.getElementsByTagName("input").length; i++) {
                if (divObj.getElementsByTagName("input")[i].type == "checkbox") {
                    if (divObj.getElementsByTagName("input")[i].id != "checker") {
                        divObj.getElementsByTagName("input")[i].checked = true;
                    }
                }
            }
        } else {
            for (i = 0; i < divObj.getElementsByTagName("input").length; i++) {
                if (divObj.getElementsByTagName("input")[i].type == "checkbox") {
                    if (divObj.getElementsByTagName("input")[i].id != "checker") {
                        divObj.getElementsByTagName("input")[i].checked = false;
                    }
                }
            }
        }
    }
}

function initSubmitForm(id, req) {
    $("#" + id).click(
        function() {
            var splitters = req.split(",");
            if (splitters) {
                var flag = false;
                for (i = 0; i < splitters.length; i++) {
                    if ($("#" + splitters[i]).is(":visible")) {
                        flag = false;
                        break;
                    } else {
                        flag = true; 
                    }
                }
                if (flag) {
                    $("#" + id).hide();
                    $(".DNNInfo_FormSubmission").show();
                }
            }
        }
    );
}


//divid = div client id for showing youtube
//pageindex = youtube paging
//newsid = news id
function buildYouTubeVideos(divid, portalid, pageindex, newsid) {
    $("#" + divid).fadeTo("slow", 0.2);
    $.ajax({
        cache: false,
        url: spath + "/DesktopModules/DNNInfo_News/YouTubeHandler.ashx?divid=" + divid + "&portalid=" + portalid + "&pageindex=" + pageindex + "&newsid=" + newsid,
        data: "{}",
        contentType: "text/html; charset=utf-8",
        dataType: "html",
        error: function(xhr, status, error) {
        },
        success: function(msg) {
            $("#" + divid).fadeTo("slow", 1);
            $("#" + divid).html(msg);
        }
    });
}

//extract youtube video
function getYouTubeVideoID(id) {
    $('#' + id).val($('#' + id).val());
    if ($('#' + id).val().match('http://(www.)?youtube|youtu\.be')) {
        $('#' + id).val($('#' + id).val().split(/v\/|v=|youtu\.be\//)[1].split(/[?&]/)[0]);
    }
}

//get youtube image
function getYoutubeImage(labelid, portalID, youtubeCode) {
    $("#" + labelid).fadeTo("slow", 0.2);
    $.ajax({
        cache: false,
        url: spath + "/DesktopModules/DNNInfo_News/YouTubeImageHandler.ashx?portalID=" + portalID + "&youtubeCode=" + youtubeCode,
        data: "{}",
        contentType: "text/html; charset=utf-8",
        dataType: "html",
        error: function(xhr, status, error) {
        },
        success: function(msg) {
        $("#" + labelid).fadeTo("slow", 1);
            $("#" + labelid).html(msg);
        }
    });
}

//divid = div client id for showing youtube
//youtubeCode = youtube code
//youtubeID = youtube video id
//newsID = news id
function loadYouTubeVideo(divid, youtubeCode, youtubeID, newsID) {
    $(document).ready(function() {
        $("#" + divid).fadeTo("slow", 0.2);
        $.ajax({
            cache: false,
            url: spath + "/DesktopModules/DNNInfo_News/YouTubeVideoHandler.ashx?divid=" + divid + "&youtubeCode=" + youtubeCode + "&youtubeID=" + youtubeID + "&nid=" + newsID,
            data: "{}",
            contentType: "text/html; charset=utf-8",
            dataType: "html",
            error: function(xhr, status, error) {
            },
            success: function(msg) {
                $("#" + divid).fadeTo("slow", 1);
                $("#" + divid).html(msg);
            }
        });
    });
}

//divid = div client id for showing comments
//portal id
//pageindex = youtube paging
//newsid = news id
function buildComments(divid, portalid, pageindex, newsid) {
    $(document).ready(function() {
        $("#" + divid).fadeTo("slow", 0.2);
        $.ajax({
            cache: false,
            url: spath + "/DesktopModules/DNNInfo_News/CommentHandler.ashx?divid=" + divid + "&portalid=" + portalid + "&newsid=" + newsid + "&pageindex=" + pageindex,
            data: "{}",
            contentType: "text/html; charset=utf-8",
            dataType: "html",
            error: function(xhr, status, error) {
            },
            success: function(msg) {
                $("#" + divid).fadeTo("slow", 1);
                $("#" + divid).html(msg);
            }
        });
    }); 
}

//we bind onclick function to a class .DNNInfo_Voting
$(document).ready(function() {
    $('.DNNInfo_Voting').click(function() {
        var obj = $(this);
        var commentid = obj.attr("id");
        var vote = "";
        if (obj.attr("class").indexOf("DNNInfo_BadVotes") >= 0) {
            vote = "-1";
            commentid = commentid.replace("DNNInfo_BadVotes", "");
        } else {
            vote = "1";
            commentid = commentid.replace("DNNInfo_GoodVotes", "");
        }
        $.ajax({
            url: spath + '/desktopmodules/dnninfo_news/votinghandler.ashx',
            data: { id: commentid, value: vote },
            type: 'POST',
            success: function(data) {
                if (data != "-") { obj.html(data); }
            },
            error: function(jxhr, msg, err) {
                //alert(err);
            }
        });
    });
});

function initiateProgressingLightBox() {
    $(document).ready(function() {
        if ($('#DNNInfo_NewsLightBox').length == 0) {
            $("<div id='DNNInfo_NewsLightBox'></div>").prependTo('body#Body');
            $('#DNNInfo_NewsLightBox').height($(document).height());
        }
        if ($('#DNNInfo_NewsLightBoxPopUp').length == 0) {
            $("<div id='DNNInfo_NewsLightBoxPopUp'></div>").prependTo('body#Body');
        }
    });
}

function initiateButtonLightBox(id, progressingMessage) {
    $(document).ready(function() {
        if ($('#' + id)) {
            $('#' + id).click(function() {
                $("#DNNInfo_NewsLightBox").fadeIn(1);
                $("#DNNInfo_NewsLightBoxPopUp").fadeIn(1);
                $("#DNNInfo_NewsLightBoxPopUp").html(progressingMessage);
            });
        }
    });
}