package com.myfinbank.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myfinbank.customer.model.Loan;

@Repository
public interface LoanRepository extends JpaRepository<Loan, Long> {
    List<Loan> findByAccount_Id(Long accountId); // Custom query to find loans by account ID
}
