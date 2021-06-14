package com.sky.service;

import com.sky.domain.Medicines;
import com.sky.dto.MedicinesDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-06-14 20:33
 */
public interface MedicinesService {
    /**
     * 分页查询
     */
    DataGridView listMedicinesPage(MedicinesDto medicinesDto);

    /**
     * 根据ID查询
     */
    Medicines getOne(Long medicinesId);

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
    int updateMedicinesStorage(Long medicinesId,Long medicinesStockNum);
}
