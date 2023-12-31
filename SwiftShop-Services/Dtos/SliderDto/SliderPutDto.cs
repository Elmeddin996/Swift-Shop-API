﻿using FluentValidation;
using Microsoft.AspNetCore.Http;


namespace SwiftShop_Services.Dtos.SliderDto
{
    public class SliderPutDto
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        public string? Desc { get; set; }
        public IFormFile? ImageFile { get; set; }
    }

    public class SliderPutDtoValidator : AbstractValidator<SliderPutDto>
    {
        public SliderPutDtoValidator()
        {
            When(x => x.ImageFile != null, () =>
            {
                RuleFor(x => x).Custom((x, context) =>
             {
                 if (x.ImageFile.Length > 6291456)
                     context.AddFailure(nameof(x.ImageFile), "ImageFile must be less or equal than 6MB");

                 if (x.ImageFile.ContentType != "image/jpeg" && x.ImageFile.ContentType != "image/png")
                     context.AddFailure(nameof(x.ImageFile), "ImageFile must be image/jpeg or image/png");
             });
            });
        }
    }
}
