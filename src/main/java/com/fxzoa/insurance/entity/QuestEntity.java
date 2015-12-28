package com.fxzoa.insurance.entity;

import java.util.Date;

public class QuestEntity {
    private Integer questId;

    private Integer goodsId;

    private String questType;

    private String questClass;

    private String questTitle;

    private String questText;

    private String anser1;

    private String anser2;

    private String anser3;

    private String anser4;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String dispFlag;

    private Date updateDate;

    private String updateUser;

    private String deleteFlag;

    public Integer getQuestId() {
        return questId;
    }

    public void setQuestId(Integer questId) {
        this.questId = questId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getQuestType() {
        return questType;
    }

    public void setQuestType(String questType) {
        this.questType = questType == null ? null : questType.trim();
    }

    public String getQuestClass() {
        return questClass;
    }

    public void setQuestClass(String questClass) {
        this.questClass = questClass == null ? null : questClass.trim();
    }

    public String getQuestTitle() {
        return questTitle;
    }

    public void setQuestTitle(String questTitle) {
        this.questTitle = questTitle == null ? null : questTitle.trim();
    }

    public String getQuestText() {
        return questText;
    }

    public void setQuestText(String questText) {
        this.questText = questText == null ? null : questText.trim();
    }

    public String getAnser1() {
        return anser1;
    }

    public void setAnser1(String anser1) {
        this.anser1 = anser1 == null ? null : anser1.trim();
    }

    public String getAnser2() {
        return anser2;
    }

    public void setAnser2(String anser2) {
        this.anser2 = anser2 == null ? null : anser2.trim();
    }

    public String getAnser3() {
        return anser3;
    }

    public void setAnser3(String anser3) {
        this.anser3 = anser3 == null ? null : anser3.trim();
    }

    public String getAnser4() {
        return anser4;
    }

    public void setAnser4(String anser4) {
        this.anser4 = anser4 == null ? null : anser4.trim();
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1 == null ? null : option1.trim();
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2 == null ? null : option2.trim();
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3 == null ? null : option3.trim();
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4 == null ? null : option4.trim();
    }

    public String getDispFlag() {
        return dispFlag;
    }

    public void setDispFlag(String dispFlag) {
        this.dispFlag = dispFlag == null ? null : dispFlag.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag == null ? null : deleteFlag.trim();
    }
}