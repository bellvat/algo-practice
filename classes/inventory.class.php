<?php 
/***************************************************
 * inventory.class.php
 *
 * Class for a group of vehicles
 * Used to generate SRP pages
 *
 ***************************************************/
class inventory{
	//properties
	public  $vehicles = array();
	public  $resultsTotal;
	
	protected $where;
	
	//methods
	public function __construct(array $where = null, array $sort = null, $limit = 16, $brief = false) {
		global $dbdsn,$dbuser,$dbpass,$lotid,$lotidUsed, $settings,$featuredMakes,$sql;
		global $usedPriceField,$newPriceField;
		global $secInv;
		//print_r($_REQUEST);
		
		$db = db::getConnection('read','inventory');
		
		$secInv = new SecureInventory();
		$secInv->addSelectFields(['dealerphone',
									'styledescription',
									'carfaxoneowner',
									'engdescription',
									'body',
									'description',
									'dealerzip',
									'engcyls',
									'engliters',
									'iolvideolink',
									'lotid',
									'daysinstock',
									'dealername',
									'vin',
									'stock',
									'type',
									'year',
									'make',
									'model',
									'trim',
									'drivetrain',
									'epacity',
									'epahighway',
									'extcolorgeneric',
									'imagecount',
									'imagelist',
									'int_colorgeneric',
									'miles',
									'standardbody',
									'standardmake',
									'standardmodel',
									'standardstyle',
									'standardtrim',
									'specials_disclaimer',
									'trans',
									'certified',
									'isspecial',
									'bookvalue',
									'internetprice',
									'invoice',
									'miscprice1',
									'miscprice2',
									'miscprice3',
									'msrp',
									'sellingprice',
									'specialprice',
									'tcuv_price',
									'tcuv_incentive',
									'friendlystyle',
									'extcolor',
									'intcolor',
									'comment1',
									'comment2',
									'comment3',
									'comment4',
									'comment5',
									'modelnumber',
									'fueltype',
									'extcolor_code'
								]);
		
		$secInv->setKeywordSearchFields([
							SecureInventory::VIN, 
							SecureInventory::STOCK, 
							SecureInventory::YEAR, 
							SecureInventory::MAKE, 
							SecureInventory::MODEL, 
							SecureInventory::TRIM, 
							SecureInventory::BODY, 
							SecureInventory::STANDARD_BODY, 
							SecureInventory::FUEL_TYPE, 
							SecureInventory::DRIVE_TRAIN, 
							SecureInventory::ENG_DESC, 
							SecureInventory::TRANSMISSION, 
							SecureInventory::TYPE, 
							SecureInventory::EXT_COLOR_GENERIC, 
							SecureInventory::COMMENT1, 
							SecureInventory::COMMENT2, 
							SecureInventory::COMMENT3, 
							SecureInventory::COMMENT4, 
							SecureInventory::COMMENT5	
						]);
		
		// setup default sorting
		$defaultPriceSortField = $newPriceField;
		if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used')
		{
			$defaultPriceSortField = $usedPriceField;
		}
		$secInv->setSortDetail([
								$defaultPriceSortField . '=0', 
								$defaultPriceSortField, 
								'lotfirst',
								'year',
								], 
								[
								'ASC',
								'ASC',
								'DESC',
								'ASC'
								]);
		
		
		
		if($_REQUEST['type'] == 'Array' || (count($_REQUEST['type']) > 1) && !isset($_REQUEST['keyword']))
		{
			$where['type'] = array('New','Used');
		}

		
		if(isset($_REQUEST['intransit']) && $_REQUEST['intransit'] == 'true' ) 
		{
			$where['lotid'] = explode(",",$settings['in_transit_lotid']);
		}
		elseif(isset($lotid) && isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'new')
		{
			$where['lotid'] = $lotid;
		}
		elseif(isset($lotidUsed) && isset($_REQUEST['type']) && count($_REQUEST['type']) > 0) 
		{
			$where['lotid'] = $lotidUsed;
		}
		elseif(isset($lotidUsed) && isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used') 
		{
			$where['lotid'] = $lotidUsed;
		}
		else 
		{
			$where['lotid'] = $lotid;
		}

		if(isset($_REQUEST['keyword']))
		{
			
			$where['keyword'] = $secInv->phraseReplace(strtolower($_REQUEST['keyword']), [
																						'pick-up' => 'pickup',
																						'trucks' => 'pickup',
																						'truck' => 'pickup',
																						'4x4' => '4wd',
																						'gt-r' => 'GT-R',
																						'4x4 truck' => '4wd',
																						'chevy' => 'chevrolet',
																						'crv' => 'CR-V',
																						'hrv' => 'HR-V',
																						'CRV' => 'CR-V',
																						'HRV' => 'HR-V'
																						]);
		}
		if(isset($_REQUEST['keyword']) && strpos($_REQUEST['keyword'], ' '))
		{
			$_REQUEST['keyword'] = $secInv->phraseReplace($_REQUEST['keyword'], [
																				'pick-up' => 'pickup',
																				'crv' => 'CR-V',
																				'hrv' => 'HR-V',
																				'exl' => 'EX-L',
																				'EXL' => 'EX-L',
																				'ext' => 'EX-T',
																				'EXT' => 'EX-T',
																				'lxp' => 'LX-P',
																				'LXP' => 'LX-P',
																				'lxs' => 'LX-S',
																				'LXS' => 'LX-S',
																				'RTLE' => 'RTL-E',
																				'rtle' => 'RTL-E'
																				]);
			$where['keyword'] = explode(" ",$_REQUEST['keyword']);
			unset($_REQUEST['keyword']);
		}
		
		if (isset($_REQUEST['body'])) 
		{
			$where['standardbody'] = $_REQUEST['body'];
			unset($where['body']);
		}
		
		if (strtolower(isset($_REQUEST['price'])))
		{
			$prices = explode('-', $_REQUEST['price']);
			$where['pricemin'] = $prices[0];
			$where['pricemax'] = $prices[1];
			unset($_REQUEST['price']);
		}
		
		if (isset($where['pg'])) 
		{
			$offset = (int)$where['pg'] * $limit - $limit;
			unset($where['pg']);
		} else {
			$offset = 0;
		}
		$this->where = $where;
		
		if(count($where)) 
		{
			if(!$brief)
			{
				$secInv->addAliasSelectFields(['lotfirst' => 'lotid']);
			}

			if(isset($_REQUEST['archive']) && strtolower($_REQUEST['archive']) == 'true') 
			{
				$secInv->setQueryForArchives();
			} 
			else 
			{
				$secInv->ignoreSoftDeletedRecords();
			}
			if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'new') 
			{
				$secInv->inferNewByYear();
			}
			
			foreach($where as $key=>$value) 
			{
				if($key == "custom") 
				{
					$secInv->addConditionalString($value);
				} 
				elseif(in_Array($key,array('milesmin','epahighwaymin','pricemin'))) 
				{
					if ($key == 'pricemin') 
					{
						if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used') 
						{
							$key = $usedPriceField;
						} 
						else 
						{
							$key = $newPriceField;
						}
					}
					$secInv->addConditionalString(str_replace('min', '', $key) .' >= ?', [$value]);
					
				}
				elseif(in_Array($key,array('milesmax','epahighwaymax','pricemax'))) 
				{
					if ($key == 'pricemax') 
					{
						if (isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used') 
						{
							$key = $usedPriceField;
						}
						else 
						{
							$key = $newPriceField;
						}
					}
					$secInv->addConditionalString(str_replace('max', '', $key) . ' <= ?', [$value]);
					
				}
				elseif($key == 'keyword') 
				{
					$genericColors = array('beige','black','blue','brown','burgundy','copper','gold', 'gray','green','grey','java','maroon','mblue','orange','platinum','purple','red','sapphire','silver','tan','teal','white','yellow');
					$sql .= ' AND (';
					//Handle Keyword Searches here
					if(is_Array($value))
					{
						foreach ($value as $subValue) 
						{
							if(in_array(strtolower($subValue),$genericColors)) 
							{
								$secInv->addConditionalString('extcolorgeneric LIKE ?', ['%' . $value . '%']);
							}
							else
							{
								$secInv->addKeywordConditions($value);
							}
						}
					}
					else
					{
						$secInv->addKeywordConditions($value);
					}
				}
				elseif ($key == 'special') 
				{
					if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used')
					{
						global $usedSpecialCriteria;
						if($usedSpecialCriteria <= 0) 
						{
							$secInv->hasSpecialsFlag();
						}
						else 
						{
							$time = strftime('%Y-%m-%d',(strtotime($usedSpecialCriteria.' days ago')));
							$secInv->addConditionalString('dateinstock < ?', [$time]);
						}
					}
					else 
					{
						global $newSpecialCriteria;
						if($newSpecialCriteria <= 0)
						{
							$secInv->hasSpecialsFlag();
							
						}
						else 
						{
							//specials based on days on lot
							$time = strftime('%Y-%m-%d',(strtotime($newSpecialCriteria.' days ago')));
							$secInv->addConditionalString('dateinstock < ?', [$time]);
						}
					}
				}
				elseif($key == 'model' && isset($_REQUEST['showroom']) && $_REQUEST['showroom'] == 1)
				{
					$secInv->addConditionalString('model LIKE ?', [$value . '%']);
				}
				else
				{
					if(is_Array($value) && count($value) > 0)
					{
						$secInv->addInConditional($key, $value);
					}
					else
					{
						if(isset($_REQUEST['model']) && (($_REQUEST['model'] == 'Accord' || $_REQUEST['model'] == 'Civic' || $_REQUEST['model'] == 'Tundra') && $key == 'model'))
						{
							$secInv->addConditionalString($key . ' LIKE ?', [$_REQUEST['model'] . '%']);
						}
						else
						{
							$secInv->addConditionalString($key . ' = ?', [$value]);
						}
					}
				}
			}
			
			if (isset($sort)) 
			{
				$secInv->setGroupByField(SecureInventory::VIN);

				$prices = array('msrp','sellingprice','invoice','miscprice1','miscprice2');
				$allowedSorts = ['msrp','sellingprice','internetprice','invoice','miscprice1','miscprice2', 'year', 'make', 'model','extcolor','miles','dateinstock', 'comment2', 'marketclass','engcyls','fueltype'];
				$allowedSortDirections = ['desc', 'asc'];
				
				$sortDetailOne = [];
				$sortDetailTwo = [];
				
				foreach($sort as $key=>$value)
				{
					if($key == 'custom')
					{
						$customSortArray = explode(" ", $value);
						if(count($customSortArray) > 1 && in_array(strtolower($customSortArray[0]), $allowedSorts) && in_array(strtolower($customSortArray[1]), $allowedSortDirections))
						{
							$sortDetailOne[] = $customSortArray[0];
							$sortDetailTwo[] = $customSortArray[1];
						}
					}
					else
					{
						if(in_array($key, $allowedSorts) && in_array(strtolower($value), $allowedSortDirections))
						{
							if(in_array($key,$prices))
							{
								$sortDetailOne[] = $key . '=0';
								$sortDetailTwo[] = '';
							}
							$sortDetailOne[] = $key;
							$sortDetailTwo[] = $value;
						}
					}
				}
				
				if(!empty($sortDetailOne))
				{
					$secInv->setSortDetail($sortDetailOne, $sortDetailTwo);
				}
			} 
			else 
			{
				$secInv->setGroupByField(SecureInventory::VIN);
				if(((count($lotidUsed) > 1 && $_REQUEST['type'] == 'used') || (count($lotid) > 1) && $_REQUEST['type'] == 'new'))
				{
					$secInv->setSortDetail(['lotfirst', 'year'], ['DESC', 'DESC']);
				}
				else
				{
					$secInv->setSortDetail('year', 'DESC');
				}
			}
			
			echo getFile('/include/inventory-custom-order.php');
			
			if(isset($_REQUEST['limit']))
			{
				$secInv->setPagination($_REQUEST['limit']);
			}
			else
			{
				$secInv->setPagination($limit, $offset);
			}
			
			// echo $sql;
			
			if((isset($_REQUEST['fairfieldspecial']) && $_REQUEST['fairfieldspecial'] == "1") || (isset($_REQUEST['oldspecial']) && $_REQUEST['oldspecial'] == "1"))
			{
				$secInv->clearConfig();
				$secInv->addSelectFields([
										'dealerzip', 
										'engcyls', 
										'engliters', 
										'iolvideolink', 
										'lotid', 
										'daysinstock', 
										'dealername', 
										'vin', 
										'stock', 
										'type', 
										'year', 
										'make', 
										'model', 
										'trim', 
										'drivetrain', 
										'epacity', 
										'epahighway', 
										'extcolorgeneric', 
										'imagecount', 
										'imagelist', 
										'int_colorgeneric', 
										'miles', 
										'standardbody', 
										'standardmake', 
										'standardmodel', 
										'standardstyle', 
										'standardtrim', 
										'trans', 
										'certified', 
										'isspecial', 
										'bookvalue', 
										'internetprice', 
										'invoice', 
										'miscprice1', 
										'miscprice2', 
										'miscprice3', 
										'msrp', 
										'sellingprice', 
										'specialprice', 
										'tcuv_price', 
										'tcuv_incentive', 
										'friendlystyle', 
										'extcolor', 
										'intcolor'
									]);
				$secInv->ignoreSoftDeletedRecords();
				$secInv->addConditionalString('type = ?', [$_REQUEST['type']]);
				$secInv->addInConditional('lotid', [$lotid[0]]);
				$secInv->setGroupByField(SecureInventory::VIN);
				$secInv->setSortDetail('dateinstock', 'ASC');
				$secInv->setPagination(10);
			}
			
			if(isset($_REQUEST['vins']))
			{
				$vinArray = explode("|",$_REQUEST['vins']);
				if(count($vinArray))
				{
					$secInv->clearConfig();
					$secInv->addSelectFields([
											'dealerzip',
											'engcyls',
											'engliters',
											'iolvideolink',
											'lotid',
											'daysinstock',
											'dealername',
											'vin',
											'stock',
											'type',
											'year',
											'make',
											'model',
											'trim',
											'drivetrain',
											'epacity',
											'epahighway',
											'extcolorgeneric',
											'imagecount',
											'imagelist',
											'int_colorgeneric',
											'miles',
											'standardbody',
											'standardmake',
											'standardmodel',
											'standardstyle',
											'standardtrim',
											'trans',
											'certified',
											'isspecial',
											'bookvalue',
											'internetprice',
											'invoice',
											'miscprice1',
											'miscprice2',
											'miscprice3',
											'msrp',
											'sellingprice',
											'specialprice',
											'tcuv_price',
											'tcuv_incentive',
											'friendlystyle',
											'extcolor',
											'intcolor'
										]);					
					$secInv->ignoreSoftDeletedRecords();
					$secInv->addInConditional('vin', $vinArray);
					$secInv->addInConditional('lotid', $lotid);
					$secInv->setGroupByField(SecureInventory::VIN);
				}
			}
			
			if(isset($_REQUEST['save']))
			{
				if(isset($_COOKIE['fzlogin']))
				{
					$dbdealerdsn = "mysql:host=aws-mysql.fzautomotive.com;dbname=dealers_v3;charset=utf8;";
					$db2 = new PDO($dbdealerdsn,$dbuser,$dbpass);
					$sql2 = "SELECT * FROM garage_vehicle WHERE garage_user_id = :userid";
					$stmt2 = $db2->prepare($sql2);
					$stmt2->bindValue(':userid', $_COOKIE['fzlogin'], PDO::PARAM_STR);
					$stmt2->execute();
					
					$result2 = $stmt2->fetchAll();
					
					foreach($result2 as $record)
					{
						$vinArray[] = $record['garage_vehicle_vin'];
					}
					
	
					if(count($vinArray))
					{
						$secInv->clearConfig();
						$secInv->addSelectFields([
											'dealerzip',
											'engcyls',
											'engliters',
											'iolvideolink',
											'lotid',
											'daysinstock',
											'dealername',
											'vin',
											'stock',
											'type',
											'year',
											'make',
											'model',
											'trim',
											'drivetrain',
											'epacity',
											'epahighway',
											'extcolorgeneric',
											'imagecount',
											'imagelist',
											'int_colorgeneric',
											'miles',
											'standardbody',
											'standardmake',
											'standardmodel',
											'standardstyle',
											'standardtrim',
											'trans',
											'certified',
											'isspecial',
											'bookvalue',
											'internetprice',
											'invoice',
											'miscprice1',
											'miscprice2',
											'miscprice3',
											'msrp',
											'sellingprice',
											'specialprice',
											'tcuv_price',
											'tcuv_incentive',
											'friendlystyle',
											'extcolor',
											'intcolor'
										]);
						$secInv->ignoreSoftDeletedRecords();
						$secInv->addInConditional('vin', $vinArray);
						$secInv->addInConditional('lotid', $lotid);
						$secInv->setGroupByField(SecureInventory::VIN);
					}
				}
			}
			
			
			if(isset($_REQUEST['debug']) && $_REQUEST['debug'] == 'true') {
				echo "<p>" . $secInv->getQuery() . "</p>";
				echo "<pre>" . print_r($secInv->getQueryBoundValues(), true) . '</pre>';
			}
			
			$result = $secInv->runQuery();
			
			//new dBug($result);
			if (count($result))
			{
				if((isset($_REQUEST['fairfieldspecial']) && $_REQUEST['fairfieldspecial'] == "1") || (isset($_REQUEST['oldspecial']) && $_REQUEST['oldspecial'] == "1") || isset($_REQUEST['limit']))
				{
					$this->resultsTotal = count($result); 
				}
				else
				{
					$this->resultsTotal = $secInv->totalFound;
					
				}

				foreach ($result as $thisResult) {
					array_push($this->vehicles, new vehicle($thisResult));
				}
	
			}
		}
		else
		{
			$stmt = $db->prepare('SELECT SQL_CALC_FOUND_ROWS * FROM inventory left join inventory_details on inventory.id = inventory_details.inventory_id and lotid = 1 and LIMIT ?');
			$stmt->bindValue(1, $limit, PDO::PARAM_INT);
			$stmt->execute();
			$result = $stmt->fetchAll();
			if (count($result)) {
				$rs1 = $db->query("SELECT FOUND_ROWS() AS 'count'"); 
				$this->resultsTotal = (int) $rs1->fetchColumn(); 
				foreach ($result as $thisResult) {
					array_push($this->vehicles, new vehicle($thisResult));
				}
				
			}
		}
		
	}
	
	public function getFilter(){
		
		if($_REQUEST['fairfieldspecial'] == "1" || $_REQUEST['oldspecial'] == "1")
		{
			return false;
		}
		
		global $dbdsn,$dbuser,$dbpass,$usedPriceField,$newPriceField,$newMakes;
		$db = db::getConnection('read','inventory');
		
		$secInv = new SecureInventory();
		
		$secInv->addUnionField([
					'dealername' => 'Location', 
					'type' => 'Condition', 
					'fueltype' => 'Fuel Type', 
					'Certified' => 'Condition', 
					'year' => 'Year', 
					'make' => 'Make', 
					'model' => 'Model', 
					'standardtrim' => 'Trim', 
					'standardbody' => 'Body', 
					'drivetrain' => 'DriveTrain', 
					'trans' => 'Transmission', 
					'extcolorgeneric' => 'Exterior Color', 
					'((miles div 10000) * 10000 ) + 9999' => 'Mileage', 
					'((epahighway div 5) * 5) + 4' => 'Highway MPG'
					]);
		
		$secInv->setKeywordSearchFields([
							SecureInventory::VIN, 
							SecureInventory::STOCK, 
							SecureInventory::YEAR, 
							SecureInventory::MAKE, 
							SecureInventory::MODEL, 
							SecureInventory::TRIM, 
							SecureInventory::BODY, 
							SecureInventory::STANDARD_BODY, 
							SecureInventory::DRIVE_TRAIN, 
							SecureInventory::TRANSMISSION, 
							SecureInventory::TYPE, 
							SecureInventory::EXT_COLOR_GENERIC, 
							SecureInventory::ENG_DESC, 
							SecureInventory::FUEL_TYPE, 
							SecureInventory::COMMENT1, 
							SecureInventory::COMMENT2, 
							SecureInventory::COMMENT3, 
							SecureInventory::COMMENT4, 
							SecureInventory::COMMENT5	
						]);
		
		
		if(count($this->where))
		{
			$wheresql = "" ;
			foreach($this->where as $key=>$value)
			{
				if ($key == "custom")
				{
					$secInv->addConditionalString($value);
				}
				elseif(in_Array($key,array('milesmin','epahighwaymin','pricemin')))
				{
					if($key == 'pricemin')
					{
						if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used')
						{
							global $usedPriceField;
							$key = $usedPriceField;
						}
						else 
						{
							global $newPriceField;
							$key = $newPriceField;
						}
					}
					$secInv->addConditionalString(str_replace('min', '', $key) .' >= ?', [$value]);
				}
				elseif(in_Array($key,array('milesmax','epahighwaymax','pricemax')))
				{
					if($key == 'pricemax')
					{
						if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used')
						{
							$key = $usedPriceField;
						}
						else
						{
							$key = $newPriceField;
						}
					}
					$secInv->addConditionalString(str_replace('max', '', $key) .' <= ?', [$value]);
				}
				elseif ($key == 'special')
				{
					if(isset($_REQUEST['type']) && strtolower($_REQUEST['type']) == 'used')
					{
						global $usedSpecialCriteria;
						if($usedSpecialCriteria <= 0)
						{
							$secInv->hasSpecialsFlag();
						}
						else
						{
							//specials based on days on lot
							$time = strftime('%Y-%m-%d',(strtotime($usedSpecialCriteria.' days ago')));
							$secInv->addConditionalString('dateinstock < ?', [$time]);
						}
					}
					else
					{
						global $newSpecialCriteria;
						if($newSpecialCriteria <= 0)
						{
							$secInv->hasSpecialsFlag();
						}
						else
						{
							//specials based on days on lot
							$time = strftime('%Y-%m-%d',(strtotime($newSpecialCriteria.' days ago')));
							$secInv->addConditionalString('dateinstock < ?', [$time]);
						}
					}
				}
				elseif($key == 'keyword')
				{
					$wheresql .= ' AND (';
					//TODO: Handle Keyword Searches here
					if(is_Array($value))
					{
						$genericColors = array('beige','black','blue','brown','burgundy','copper','gold', 'gray','green','grey','java','maroon','mblue','orange','platinum','purple','red','sapphire','silver','tan','teal','white','yellow');

						foreach ($value as $subValue)
						{
							if (in_array(strtolower($subValue),$genericColors))
							{
								$secInv->addConditionalString('extcolorgeneric LIKE ?', ['%' . $value . '%']);
							}
							else
							{
								$secInv->addKeywordConditions($value);
							}
						}
					}
					else
					{
						$secInv->addKeywordConditions($value);
					}
				}
				elseif ($key == 'model' && isset($_REQUEST['showroom']) && $_REQUEST['showroom'] == 1)
				{
					$secInv->addConditionalString('model LIKE ?', [$value . '%']);
				}
				else
				{
					if(is_Array($value) && count($value) > 0)
					{
						$secInv->addInConditional($key, $value);
					}
					else
					{
						$secInv->addConditionalString($key . ' = ?', [$value]);
					}
				}
			}
		}
		
		$sql = '';
		if(isset($_REQUEST['archive']) && strtolower($_REQUEST['archive']) == 'true')
		{
			$secInv->setQueryForArchives();
			
			if(isset($newMakes) && !isset($_REQUEST['make']) && count($newMakes) > 0 && $newMakes[0] != '')
			{
				$secInv->addInConditional('make', $newMakes);
			}
		}
		else
		{
			$secInv->ignoreSoftDeletedRecords();
			$secInv->setUseCaseSubQueryPriceFields($usedPriceField, $newPriceField);
		}
		

		$result = $secInv->runFilterQuery();
		
		
		if(isset($_REQUEST['debug']) && $_REQUEST['debug'] == 'true')
		{
			echo "<p>" . $secInv->getFilterQuery() . "</p>";
			echo "<pre>" . print_r($secInv->getFilterQueryBoundValues(), true) . "</pre>";
		}
		
		
		foreach ($result as $row)
		{
			$filter[$row['type']] = array();
		}
		
		foreach ($result as $row)
		{
			if($row['count'] > 0)
			{
				array_push($filter[$row['type']],$row);
			}
		}
		
		if(isset($filter))
		{
			//should sort in a foreach
			return $filter;
		}
		else
		{
			return false;
		}
	}
	
	static public function getFeatured($type='used', $certified=false, $limit=12, $realImagesOnly=false) {
		global $dbdsn,$dbuser,$dbpass,$usedPriceField,$newPriceField, $lotid,$featuredMakes;
		$where = array();
		$where['type'] = $type;
		if($certified) {
			$where['certified'] = true;
		}
		
		if(count($featuredMakes) > 0 && $featuredMakes[0] != '') {
		
			$where['make'] = $featuredMakes;
		}
		if($type == 'used'){
			$where['custom'] = "imagecount > 2 ";
		} elseif($type == 'new'){
			if ($realImagesOnly)
				$where['custom'] = "(imagecount > 2)";
			else 
				$where['custom'] = "(imagecount > 2 OR chromemultiviewext1url IS NOT NULL)";
		}
		$sort = array("custom"=>"RAND() ");
		$inv = new inventory($where, $sort, $limit);
		return $inv;
            
	}
	static public function getSimilar($type='used', $certified=false, $limit=12, $realImagesOnly=false) {
		global $dbdsn,$dbuser,$dbpass,$usedPriceField,$newPriceField, $lotid,$featuredMakes;
		$where = array();
		$where['type'] = $type;
		if($certified) {
			$where['certified'] = true;
		}
	
		if(count($featuredMakes) > 0 && $featuredMakes[0] != '') {
	
			$where['make'] = $featuredMakes;
		}
		if($type == 'used'){
			$where['custom'] = "imagecount > 2 ";
		} elseif($type == 'new'){
			if ($realImagesOnly)
				$where['custom'] = "(imagecount > 2)";
			else
				$where['custom'] = "(imagecount > 2 OR chromemultiviewext1url IS NOT NULL)";
		}
		$sort = array("custom"=>"RAND() ");
		$inv = new inventory($where, $sort, $limit);
		return $inv;
	
	}
	static public function getRSS($type='used', $certified=false, $limit=8) {
		global $dbdsn,$dbuser,$dbpass,$usedPriceField,$newPriceField, $lotid,$featuredMakes;
		$where = array();
		$where['type'] = $type;
		$sort = array("dateinstock"=>"DESC");
		$inv = new inventory($where, $sort, $limit, false);
		ini_set('display_errors',0);  error_reporting(E_ALL); ini_set('log_errors',1);
		$xmlDoc = new DOMDocument();
		$root = $xmlDoc->appendChild($xmlDoc->createElement("rss"));
		$root->setAttribute("version", "2.0");
		$channel = $root->appendChild($xmlDoc->createElement("channel"));
		$title = $channel->appendChild($xmlDoc->createElement("title"));
		$title->nodeValue = "Inventory";
		$link = $channel->appendChild($xmlDoc->createElement("link"));
		$link->nodeValue = "http://"  . $_SERVER['HTTP_HOST'];
		$description = $channel->appendChild($xmlDoc->createElement("description", $inv->vehicles[0]->dealername . " " . $inv->vehicles[0]->dealeraddress . ", " . $inv->vehicles[0]->dealercity . ", " . $inv->vehicles[0]->dealerstate . " " . $inv->vehicles[0]->dealerzip . " - Inventory"));
		$lastBuildDate = $channel->appendChild($xmlDoc->createElement("lastBuildDate", date("D, j M Y gis A e")));
		$language = $channel->appendChild($xmlDoc->createElement("language", "en-us"));
		global $vehicle;
		foreach ($inv->vehicles as $vehicle) {
			$item = $channel->appendChild($xmlDoc->createElement("item"));
			if (strtolower($vehicle->type == 'new' && $vehicle->$newPriceField > 0)) {
				$itemtitle = $item->appendChild($xmlDoc->createElement("title", $vehicle->year . " " . $vehicle->make . " " . $vehicle->model . " ($" . number_format($vehicle->$newPriceField) . ")"));
			} elseif ($vehicle->$usedPriceField > 0) {
				$itemtitle = $item->appendChild($xmlDoc->createElement("title", $vehicle->year . " " . $vehicle->make . " " . $vehicle->model . " ($" . number_format($vehicle->$usedPriceField) . ")"));
			} else {
				$itemtitle = $item->appendChild($xmlDoc->createElement("title", $vehicle->year . " " . $vehicle->make . " " . $vehicle->model));
			}
			//vehicle-details/used-2010-volkswagen-new-beetle-coupe-final-edition-3VWPW3AGXAM009598
			$itemlink = $item->appendChild($xmlDoc->createElement("link", "http://"  . $_SERVER['HTTP_HOST'] . "/vehicle-details/" . $vehicle->type . "-" . $vehicle->year . "-" . trim($vehicle->make) . "-" . trim($vehicle->model) . "-" . trim($vehicle->trim) . "-" . $vehicle->vin));
			$itemdate = $item->appendChild($xmlDoc->createElement("date", $vehicle->dateinstock));
			$itemguid = $item->appendChild($xmlDoc->createElement("guid", "http://"  . $_SERVER['HTTP_HOST'] . "/vehicle-details/" . $vehicle->type . "-" . $vehicle->year . "-" . trim($vehicle->make) . "-" . trim($vehicle->model) . "-" . trim($vehicle->trim) . "-" . $vehicle->vin));
			$itemcategory = $item->appendChild($xmlDoc->createElement("category", $vehicle->make . " " . $vehicle->model));
			
				$photo = new vehiclePhotos(1);
				$itemdescription = $item->appendChild($xmlDoc->createElement("description", "<img src='" . $photo->photos[0] . "'><br>" . $vehicle->description));
			
		}
		
		return $xmlDoc->saveXML();
	}
	
	static public function getArchive($type='used', $certified=false, $limit=8) {
		global $dbdsn,$dbuser,$dbpass,$usedPriceField,$newPriceField, $lotid,$featuredMakes;
		$where = array();
		$where['type'] = $type;
		$sort = array("model"=>"ASC");
		$sort = array("make"=>"ASC");
		$sort = array("year"=>"DESC");
		
		
		$inv = new inventory($where, $sort, $limit, false);
		$vehicles = array();
		$protocol = isset($_SERVER["HTTPS"]) ? 'https://' : 'http://';
		foreach ($inv->vehicles as $vehicle) {
			
			$vehicles[$vehicle->year . ' ' . $vehicle->make . ' ' . $vehicle->model . ' ' . $vehicle->trim . ' | ' . $vehicle->vin] = $protocol  . $_SERVER['HTTP_HOST'] . "/vehicle-details/" . strtolower(str_replace(' ','-',$vehicle->type . "-" . $vehicle->year . "-" . $vehicle->make . "-" . $vehicle->model . "-" . $vehicle->standardbody . "-" . $vehicle->standardtrim)) . "-" . $vehicle->vin;
		
			
				
			
				
		}
		return $vehicles;
	}
	
	static public function getMenuCount($type='new') {
		global $dbdsn,$dbuser,$dbpass,$lotid;
		
		$db = db::getConnection('read','inventory');		
		$encode = array();	
		
		if (is_Array($lotid) && count($lotid) > 0){
			$sql = "SELECT count(DISTINCT vin) count, model, make 
	                from inventory 
	                where 1=1
	               ";     
					
					
					if (is_Array($lotid) && count($lotid) > 0){
							$sql .= " AND lotid IN(";
							$i = 1;
							foreach ($lotid as $subValue) {
								$sql .= "'".$subValue."'";
								$i++;
								if($i != count($lotid) + 1)
								{
									$sql .= ',';
								}
							}
							$sql .= ") ";
					
					}
					
	           $sql .=   "and type = 'new'
	                    and nullif (dateRemoved,'') is  null 
	                group by make,model";
	                
			$stmt = $db->prepare($sql);
			$stmt->execute();
			$result = $stmt->fetchAll();	/* */			
			
			
			foreach($result as $item) {
				
				$thisModel = strtolower(str_replace(" ","-",$item['model']));
				$thisModel = preg_replace('#[ -]+#', '-', $thisModel);
				
				$thisMake = strtolower($item['make']);
				
				$imagePath = "https://stock.fzautomotive.com/models/{$item['make']}/{$thisModel}.png?404=nophoto.jpg&width=110&height=60&mode=crop";
				
				$encode[] = array(
					'image' => $imagePath,	
					'make' => $item['make'],
					'model' => $item['model'],
					'count' => $item['count']					
				);
			}
		}
						
		return json_encode($encode);
	}
	
}

?>
