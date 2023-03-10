package com.sky.service;


import com.sky.domain.Medicines;
import com.sky.dto.MedicinesDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-6-11 16:24
 */
public interface MedicinesService {

    /**
     * 分页查询
     */
    DataGridView listMedicinesPage(MedicinesDto medicinesDto);

    /**
     * 根据ID查询
     */
    Medicines getOne(Long MedicinesId);

    /**
     * 添加
     */
    int addMedicines(MedicinesDto medicinesDto);

    /**
     * 修改
     */
    int updateMedicines(MedicinesDto medicinesDto);

    /**
     * 根据ID删除
     */
    int deleteMedicinesByIds(Long[] medicinesIds);

    /**
     * 查询所有可用生产厂家
     */
    List<Medicines> selectAllMedicines();

    /**
     * 调整库存
     */
    int updateMedicinesStorage(Long medicinesId, Long medicinesStockNum);

    /**
     * 发药
     */
    int deductionMedicinesStorage(Long medicinesId, long num);
}

