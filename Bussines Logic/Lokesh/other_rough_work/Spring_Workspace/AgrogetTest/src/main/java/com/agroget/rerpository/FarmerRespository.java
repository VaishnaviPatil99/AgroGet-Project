package com.agroget.rerpository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.agroget.entity.FarmerEntity;

@Repository
public interface FarmerRespository extends JpaRepository<FarmerEntity, Integer>
{
	@Query(value= "SELECT * FROM farmer_info_tbl U WHERE U.Farmer_Username=:uname AND U.Farmer_Password=:pass",nativeQuery=true)
	public FarmerEntity loginFarmer(@Param("uname") String username,
			@Param("pass") String password);
}

