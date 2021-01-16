using System;
using System.Collections.Generic;

namespace ajax_serverside_processing.Models
{
    public partial class ShippingTb
    {
        public int Id { get; set; }
        public string OrderId { get; set; }
        public string Country { get; set; }
        public string ShipCity { get; set; }
        public string ShipAddress { get; set; }
        public string CompanyAgent { get; set; }
        public string CompanyName { get; set; }
        public DateTime? ShipDate { get; set; }
        public int? Status { get; set; }
        public int? Type { get; set; }
    }
}
