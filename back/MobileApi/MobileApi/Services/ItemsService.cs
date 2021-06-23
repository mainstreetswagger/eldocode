using MobileApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Services
{
    public interface IItemsService
    {
        List<Item> GetItems();
        Cart AddCart(List<Guid> items, Guid customer, Guid at);
        List<Item> GetItemsByCart(Guid cartId);
        List<Item> GetAllItemsByCart(Guid atId, Guid customerId);
    }
    public class ItemsService : IItemsService
    {
        private eldoradoContext _db;
        public ItemsService(eldoradoContext db)
        {
            _db = db;
        }
        public List<Item> GetItems()
        {
            return _db.Items.ToList();
        }
        public Cart AddCart(List<Guid> items, Guid customer, Guid at)
        {
            var id = Guid.NewGuid();
            var cart = new Cart { CustomerId = customer, AssistantId = at, Id = id };
            var c = _db.Carts.Add(cart);
            
            var list = new List<CartToItem>();
            foreach (var i in items)
            {
                list.Add(new CartToItem { ItemId = i, CartId = c.Entity.Id });
            }
            _db.CartToItems.AddRange(list);
            _db.SaveChanges();
            return c.Entity;
        }
        public List<Item> GetItemsByCart(Guid cartId)
        {
            var matches = _db.CartToItems.Where(x => x.Id == cartId);
            List<Item> items = new List<Item>();
            foreach(var i in matches)
            {
                items.Add(_db.Items.FirstOrDefault(x => x.Id == i.ItemId));
            }
            return items;
        }
        public List<Item> GetAllItemsByCart(Guid atId, Guid customerId)
        {
            return _db.Carts
                .Join(_db.CartToItems, o => o.Id, i => i.CartId, (o, i) => new { i.ItemId })
                .Join(_db.Items, o => o.ItemId, i => i.Id, (o, i) => i)
                .ToList();
        }
    }
}
