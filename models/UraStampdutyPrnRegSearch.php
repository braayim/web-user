<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UraStampdutyPrnReg;
if (!Yii::$app->session->isActive){
          session_start();  
      }

/**
 * UraStampdutyPrnRegSearch represents the model behind the search form about `app\models\UraStampdutyPrnReg`.
 */
class UraStampdutyPrnRegSearch extends UraStampdutyPrnReg
{
    public $modelSearch;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'payment_id'], 'integer'],
            [['vrn', 'tin', 'registered_name', 'amount', 'prn', 'modelSearch', 'date_registered', 'status', 'date_pushed_to_bank', 'date_confirmed', 'bank_trans_ref', 'ura_trans_ref'], 'safe'],
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
        $query = UraStampdutyPrnReg::find();

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
            'date_registered' => $this->date_registered,
            'payment_id' => $this->payment_id,
            'date_pushed_to_bank' => $this->date_pushed_to_bank,
            'date_confirmed' => $this->date_confirmed,
        ]);

        $query->orFilterWhere(['ilike', 'vrn', $this->modelSearch])
            ->orFilterWhere(['ilike', 'tin', $this->modelSearch])
            ->orFilterWhere(['ilike', 'registered_name', $this->modelSearch])
            ->orFilterWhere(['ilike', 'amount', $this->modelSearch])
            ->orFilterWhere(['ilike', 'prn', $this->modelSearch])
            ->orFilterWhere(['ilike', 'status', $this->modelSearch])
            ->orFilterWhere(['ilike', 'bank_trans_ref', $this->modelSearch])
            ->orFilterWhere(['ilike', 'ura_trans_ref', $this->modelSearch]);

     unset($_SESSION['exportData']);
    $_SESSION['exportData'] = $dataProvider;

        return $dataProvider;
    }

    public static function getExportData() 
    {
    $data = [
            'data'=>$_SESSION['exportData'],
            'fileName'=>'ura-stampduty-prn-reg', 
            'title'=>'URA Stampduty PRN Registration',
            'exportFile'=>'/ura-stampduty-prn-reg/exportPdfExcel',
        ];

    return $data;
    }

}
