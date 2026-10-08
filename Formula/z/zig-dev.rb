class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261006-143949"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "806736bc1bdffbca0cb9398470bb6c79221bb267c540f611a05934b4b45ecb23"
    sha256 cellar: :any_skip_relocation, sequoia:      "c02091cbcf56493340602d8097535776f6e173b62de3341ef14e84de8652e192"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba0e3a0506955bc977e9fb319b1eece81bbad4c920eaf83c28f3c10308b2f8cf"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "caf7d24ce02320c17febe1db155a44b77418133a11676f2d8ee370cec8dc866c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b6225af37ce3700dae0326af70d44414bb7b85aaf846243122d945016077c60c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3951b362fb29a478fe299f8904a3e7fa7f137c627cac81710af958a791536ad6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.120+9fe22a29b.tar.xz"
  version "0.18.0-dev.120+9fe22a29b"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
