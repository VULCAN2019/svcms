package com.rimi.cms.common;

import java.util.List;

/**
 * 分页
 *
 * @author shangzf
 * @date 2019/9/16 9:35
 */
public class Page<T> {
    /**
     * 分页后的数据集合
     */
    private List<T> pageData;
    /**
     * 当前的页码
     */
    private Integer currentPage = 1;
    /**
     * 每页显示条数
     */
    private Integer pageSize = 8;
    /**
     * 总条数
     */
    private Integer totalCount;

    public int getPageCount() {
        if (this.totalCount % this.pageSize == 0){
            return this.totalCount / this.pageSize;
        }
        return this.totalCount / this.pageSize + 1;
    }

    /**
     * 创建分页对象
     *
     * @param currentPage 当前页码
     * @return 分页对象
     */
    public static Page of(Integer currentPage) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        return page;
    }

    /**
     * 获取当前页面后，判断当前页是否大于0
     * @return
     */
    public int getCurrentSize() {
        Integer cp = this.currentPage;
        //判断当前页是否大于0
        if (cp > 0) {
            //大于0后点击前一页就跳到前一页的页面数据
            cp -= 1;
        } else {
            // 否则就没法再下一边
            cp = 0;
        }

        // 判断分页开始的位置是否大于总条数
        int currentSize = cp * this.pageSize;
        if (currentSize > this.totalCount){
            // (5-1)*10   38
            // 获取总分页数
            currentSize = (this.currentPage - 1) * pageSize;
        }
        return currentSize;
    }


    public List<T> getPageData() {
        return pageData;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
}
