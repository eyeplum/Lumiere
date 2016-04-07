// vim: set softtabstop=2 :

import Foundation

let Version = "0.2"

struct Slide
{
  let title: String
  let bulletPoints: [String]
}

struct JSONKeys
{
  static let title = "title"
  static let bulletPoints = "bullet_points"
}

func loadSlides(fileURL: NSURL) -> [Slide]?
{
  guard let slidesData = NSData(contentsOfURL: fileURL) else
  {
    print("Invalid slides data.")
    return nil
  }

  guard let slidesJSONObject = try? NSJSONSerialization.JSONObjectWithData(slidesData, options: []),
        let slidesJSON = slidesJSONObject as? [[String : AnyObject]] else
  {
    print("Invalid slides data.")
    return nil
  }

  var slides: [Slide] = []
  for (index, slideJSON) in slidesJSON.enumerate()
  {
    guard let title = slideJSON[JSONKeys.title] as? String,
          let bulletPoints = slideJSON[JSONKeys.bulletPoints] as? [String] else
    {
      continue
    }

    let slideTitle = "\(title) [\(index + 1)/\(slidesJSON.count)]"
    let slide = Slide(title: slideTitle, bulletPoints: bulletPoints)
    slides.append(slide)
  }

  return slides
}

func startDisplayLoop(slides: [Slide])
{
  print("Bonjour! ಠ_ರೃ ")
  print("Je suis Lumière, your personal projector.")
  print("Press enter to start.")
  print("")

  var finished = false
  var slideIndex = 0
  var bulletPointIndex: Int? = nil
  while !finished
  {
    NSFileHandle.fileHandleWithStandardInput().availableData

    if slideIndex < slides.count
    {
      let slide = slides[slideIndex]
      if let bIndex = bulletPointIndex
      {
        if bulletPointIndex < slide.bulletPoints.count
        {
          print("  > \(slide.bulletPoints[bIndex])")
          bulletPointIndex! += 1
        }
        else
        {
          bulletPointIndex = nil
          slideIndex += 1
        }
      }
      else
      {
        print(">>> \(slide.title)")
        bulletPointIndex = 0
      }
    }
    else
    {
      print("All slides have been displayed.") 
      print("Thank you for using Lumière.")
      print("Au revoir! ಠ_ರೃ  \n")
      finished = true
    }
  }
}

let args = NSProcessInfo.processInfo().arguments

if let slidesFilePath = args.last
{
  let slidesFileURL = NSURL(fileURLWithPath: slidesFilePath)
  if let slides = loadSlides(slidesFileURL)
  {
    print("")
    print("Lumière v\(Version) has successfully loaded '\(slidesFilePath)' (\(slides.count) pages).")
    print("")
    startDisplayLoop(slides)
  }
  else
  {
    print("Failed to load slides.")
  }
}
else
{
  print("Usage: lumiere file")
}

