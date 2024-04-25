package com.task.util;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaskVO {

    @NotEmpty(message = "Title must not be Blank")
    private String title;

    @NotEmpty(message = "Description must not be Blank")
    private String description;

    @NotEmpty(message = "Status must not be Blank")
    private String status;
}
