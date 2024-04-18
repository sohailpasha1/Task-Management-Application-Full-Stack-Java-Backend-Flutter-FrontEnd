package com.task.util;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.NotBlank;
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

    @NotBlank(message = "Title must not be Blank")
    private String title;

    @NotBlank(message = "Description must not be Blank")
    private String description;

    @NotBlank(message = "Status must not be Blank")
    private String status;

}
