using AutoMapper;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Common.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.AutoMapper
{
    public class ItemDtoProfile : Profile
    {
        public ItemDtoProfile()
        {
            CreateMap<ItemDto, SelectListItem>()
                .ForMember(dest => dest.Value, src => src.MapFrom(opt => opt.Id))
                .ForMember(dest => dest.Text, src => src.MapFrom(opt => opt.Name));
        }
    }
}
