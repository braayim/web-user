<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\PaymentsReceived;

if (!Yii::$app->session->isActive){
          session_start();  
      }

/**
 * PaymentsReceivedSearch represents the model behind the search form about `app\models\PaymentsReceived`.
 */
class PaymentsReceivedSearch extends PaymentsReceived
{
    
    public $modelSearch;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'aggregator', 'amount'], 'integer'],
            [['aggregator_transaction_id', 'vehicle_reference', 'modelSearch', 'aggregator_payment_processed_date', 'date_received', 'aggregator_payment_reference', 'aggregator_memo', 'payer_mobile', 'payer_email', 'payer_name', 'payment_recon_flag', 'payment_status'], 'safe'],
            [['sticker_generated'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = PaymentsReceived::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'aggregator' => $this->aggregator,
            'aggregator_payment_processed_date' => $this->aggregator_payment_processed_date,
            'date_received' => $this->date_received,
            'amount' => $this->amount,
            'sticker_generated' => $this->sticker_generated,
        ]);

        $query->orFilterWhere(['ilike', 'aggregator_transaction_id', $this->modelSearch])
            ->orFilterWhere(['ilike', 'vehicle_reference', $this->modelSearch])
            ->orFilterWhere(['ilike', 'aggregator_payment_reference', $this->modelSearch])
            ->orFilterWhere(['ilike', 'aggregator_memo', $this->modelSearch])
            ->orFilterWhere(['ilike', 'payer_mobile', $this->modelSearch])
            ->orFilterWhere(['ilike', 'payer_email', $this->modelSearch])
            ->orFilterWhere(['ilike', 'payer_name', $this->modelSearch])
            ->orFilterWhere(['ilike', 'payment_recon_flag', $this->modelSearch])
            ->orFilterWhere(['ilike', 'payment_status', $this->modelSearch]);

       unset($_SESSION['exportData']);
    $_SESSION['exportData'] = $dataProvider;

        return $dataProvider;
    }

    public static function getExportData() 
    {
    $data = [
            'data'=>$_SESSION['exportData'],
            'fileName'=>'payment-received', 
            'title'=>'Payment Received',
            'exportFile'=>'/payments-received/exportPdfExcel',
        ];

    return $data;
    }
}
