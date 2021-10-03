package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1767:int = 0;
      
      public static const const_1647:int = 1;
      
      public static const const_1409:int = 2;
      
      public static const const_1919:int = 3;
      
      public static const const_1849:int = 4;
      
      public static const const_1928:int = 5;
      
      public static const const_1646:int = 10;
      
      public static const const_1838:int = 11;
      
      public static const const_1910:int = 12;
      
      public static const const_1892:int = 13;
      
      public static const const_1927:int = 16;
      
      public static const const_1750:int = 17;
      
      public static const const_1859:int = 18;
      
      public static const const_1883:int = 19;
      
      public static const const_1823:int = 20;
      
      public static const const_1871:int = 22;
      
      public static const const_1718:int = 23;
      
      public static const const_1794:int = 24;
      
      public static const const_1815:int = 25;
      
      public static const const_1749:int = 26;
      
      public static const const_1795:int = 27;
      
      public static const const_1833:int = 28;
      
      public static const const_1882:int = 29;
      
      public static const const_1832:int = 100;
      
      public static const const_1897:int = 101;
      
      public static const const_1914:int = 102;
      
      public static const const_1751:int = 103;
      
      public static const const_1719:int = 104;
      
      public static const const_1726:int = 105;
      
      public static const const_1878:int = 106;
      
      public static const const_1826:int = 107;
      
      public static const const_1774:int = 108;
      
      public static const const_1933:int = 109;
      
      public static const const_1905:int = 110;
      
      public static const const_1793:int = 111;
      
      public static const const_1781:int = 112;
      
      public static const const_1904:int = 113;
      
      public static const const_1932:int = 114;
      
      public static const const_1713:int = 115;
      
      public static const const_1708:int = 116;
      
      public static const const_1934:int = 117;
      
      public static const const_1829:int = 118;
      
      public static const const_1745:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1647:
            case const_1646:
               return "banned";
            case const_1409:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
