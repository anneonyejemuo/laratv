<?php
class PaypalModel extends CI_Model
{
    /**
     * Update user subscription status
     *
     * @param array $cart
     * @return void
    */
    public function updateUserSubscription($cart)
    {
        $sql = "UPDATE 2d_users SET customer_id = ?, subscriber = ?, badge = ? WHERE id = ?";
        $this->db->query($sql, array($cart['paypal_payer_id'], 1, $cart['badge'], $cart['user_id']));
        return $this->db->affected_rows();
    }

    public function activeSubscription($cart)
    {
        $sql = 'INSERT INTO 2d_payments (id_user, price, currency, status, type, subscription_id, date_created, date_modified, date_end, ip) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$this->db->query($sql, array($cart['user_id'], $cart['shopping_cart']['grand_total'], 'USD', $cart['paypal_ack'], 2, $cart['paypal_transaction_id'], date("Y-m-d H:i:s"), date("Y-m-d H:i:s"), $cart['date_end'], $this->input->ip_address()));
        return $this->db->insert_id();
    }

     public function addNotification($type = 3)
    {
        $sql = "INSERT INTO 2d_notifications (type, new, date_created, date_modified) VALUES (?, ?, ?, ?)";
        $query = $this->db->query($sql, array($type, TRUE, date("Y-m-d H:i:s"), date("Y-m-d H:i:s")));
        return $this->db->insert_id();
    }

    public function updatePaymentStats($type)
    {
        $sql = "SELECT attribut, value FROM 2d_stats WHERE date_created = ? AND attribut = ?";
        $query = $this->db->query($sql, array(date('Y-m-d'), $type));
        if($result = $query->row()) {
            $newStat = $result->value+1;
            $sql = "UPDATE 2d_stats SET value = ? WHERE date_created = ? AND attribut = ?";
            $this->db->query($sql, array($newStat, date('Y-m-d'), $type));
        } else {
            $sql = "INSERT INTO 2d_stats (attribut, value, date_created) VALUES (?, ?, ?)";
            $this->db->query($sql, array($type, 1, date('Y-m-d')));
        }
    }
}


